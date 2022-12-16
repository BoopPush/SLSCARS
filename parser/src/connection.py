import time
import requests
import js2py

from bs4 import BeautifulSoup


def _get_fort():
    session = requests.Session()
    response = session.get(url='https://bidfax.info/')
    script = BeautifulSoup(response.text, 'html.parser').find_all('script')[1].get_text()
    slowAES = session.get('https://bidfax.info/aes.min.js').text
    jslogic = script.split('document.cookie="')[0]
    FORT = js2py.eval_js(slowAES + jslogic + " toHex(slowAES.decrypt(c,2,a,b));")
    return FORT


def _get_session():
    session = requests.Session()
    session.cookies.update({'FORT': _get_fort()})
    session.headers.update(
        {
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) "
                          "Chrome/94.0.4606.71 Safari/537.36",
            "accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,"
                      "application/signed-exchange;v=b3;q=0.9",
            "Accept-Language": "accept-language: ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7",
            "Accept-Encoding": "gzip, deflate, br",
            "DNT": "1",
            "Connection": "close",
            "Upgrade-Insecure-Requests": "1",
            "Cache-Control": "max-age=0"
        })
    time.sleep(2)
    return session
