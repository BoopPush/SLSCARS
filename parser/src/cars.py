import re
import time
from collections import OrderedDict

from bs4 import BeautifulSoup

from connection import _get_session


def get_car_data():
    """Requests cars data from bidfax.info and returns it."""
    bidfax_response = get_bidfax_response()
    car_data = parse_car_data(bidfax_response)
    return car_data


def get_bidfax_response():
    return _get_session().get('https://bidfax.info/')


def parse_car_data(bidfax_response):
    brand_data = _parse_brand_data(bidfax_response)
    brand_pages = _get_brand_pages(brand_data)
    car_urls = _get_list_car_urls(brand_pages)
    return _get_detail_car_data(car_urls)


def _parse_brand_data(bidfax_response):
    soup = BeautifulSoup(bidfax_response.text, 'lxml')
    brand_data = [{brand_data.text: {'brand_urls': [brand_data.get('href')]}} for brand_data in
                   soup.find('div', class_='drop-menu-main-sub').find_all('a')]
    return brand_data


def _get_brand_pages(brand_data: list):
    for x in brand_data:
        for k in x:
            for i in range(2, 100):
                x[k]['brand_urls'].append('{}page/{}'.format(x[k]['brand_urls'][0], i))
    return brand_data


def _get_list_car_urls(car_data: list):
    detail_cars_urls = []
    for car in car_data[:3]:
        for brand_name in car:
            for url in car[brand_name].get('brand_urls')[:1]:
                try:
                    urls_per_page = _parse_list_car_urls(_get_session().get(url=url).text)
                    detail_cars_urls += urls_per_page
                    time.sleep(2)
                except Exception as e:
                    break
                # if len(urls_per_page) < 10:
                #     break
    return detail_cars_urls


def _parse_list_car_urls(detail_car_data: str) -> list:
    soup = BeautifulSoup(detail_car_data, 'lxml')
    cars = soup.find_all('div', class_='thumbnail offer')
    if not cars:
        raise Exception

    def find_a(car):
        try:
            return car.find('a').get('href')
        except AttributeError as e:
            pass
    return [find_a(car) for car in cars if find_a(car)]


def _get_detail_car_data(car_urls: list) -> list:
    return [_parse_detail_car_data(_get_session().get(url=url).text) for url in car_urls]


def _parse_detail_car_data(detail_car_data):
    soup = BeautifulSoup(detail_car_data, 'lxml')
    car_info = {info.text.split(':')[0]: info.text.split(':')[1].strip().replace(u'\xa0', u' ') for info in
                soup.find('div', id='aside').find_all('p')
                if not re.match('Цена ремонта', info.text)}
    car_info.update(_get_image(soup))
    car_info.update(_get_brand_and_model_name(soup))
    car_info.update(_get_car_price(soup))
    return car_info


def _get_image(soup: BeautifulSoup) -> dict:
    print(soup)
    img_url = soup.find('div', class_='col-xs-12 col-md-12').find('div', class_='full-screens').find('img').get('src')
    return {'image': img_url}


def _get_brand_and_model_name(soup: BeautifulSoup) -> dict:
    brand = soup.find_all('div', class_='demo')[0].find('span').text
    model = soup.find_all('div', class_='demo')[1].find('span').text
    return {'BrandName': brand, 'ModelName': model}


def _get_car_price(soup: BeautifulSoup) -> dict:
    return {'BID': soup.find('div', class_='bidfax-price').find('span').text}


def _get_transformation_data(car_data: dict) -> dict:
    lots = OrderedDict(
        [('Color', car_data['Цвет кузова']), ('Mileage', car_data['Пробег'].split(' ')[0]), ('VIN', car_data['VIN']),
         ('SaleDate', car_data['Дата продажи']), ('Age', car_data['Год выпуска']), ('Bid', car_data['BID'])])
    conditions = OrderedDict(
        [('PrimaryDamage', car_data['Основное повреждение']), ('SecondaryDamage', car_data['Второстепенное повреждение']),
         ('Condition', car_data['Состояние'])]
    )
    image = OrderedDict([('FilePath', car_data['image'])])
    note = OrderedDict([('Note', car_data['Примечание'])])
    auction = OrderedDict([('AuctionName', car_data['Аукцион']), ('Documents', car_data['Документы']),
                           ('Location', car_data['Место продажи']), ('Seller', car_data['Продавец'])])
    spec = OrderedDict([('Transmission', car_data['Коробка передач'])])

