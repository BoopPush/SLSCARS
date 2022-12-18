import re
import time

from bs4 import BeautifulSoup

from connection import _get_session


def get_car_data():
    """Requests cars data from bidfax.info and returns it."""
    bidfax_response = _get_bidfax_response()
    car_data = _parse_car_data(bidfax_response)
    return car_data


def _get_bidfax_response():
    return _get_session().get('https://bidfax.info/')


def _parse_car_data(bidfax_response):
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
    return car_info
