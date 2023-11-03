from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time
import csv

user_agent = '--user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36'

options = webdriver.ChromeOptions()
options.add_argument('--ignore-certificate-errors')
options.add_argument(user_agent)

# 웹 드라이버 실행 (Chrome의 경우)
driver = webdriver.Chrome(options=options)
driver.get("https://m.pet-friends.co.kr/category/1/2/73?productGroup2Id=1&filters=orderBy%5C-product_score")
driver.implicitly_wait(10)  # Increase the implicit wait if needed

# 페이지가 로딩될 때까지 기다림
wait = WebDriverWait(driver, 10)
wait.until(EC.presence_of_element_located((By.CLASS_NAME, 'c-dYjrYg')))

# CSV 파일에 데이터를 저장하기 위한 리스트
csv_data = []

elements = driver.find_elements(By.XPATH, '//*[@id="__next"]/span[2]/div/div/main/section/ol/a')
initial_count = len(elements)
initial_item_count = len(elements)  # 추가: 초기 요소 수를 추적

for i in range(initial_count):
    try:
        elements = driver.find_elements(By.XPATH, '//*[@id="__next"]/span[2]/div/div/main/section/ol/a')
        current_element = elements[i]
        driver.execute_script("arguments[0].scrollIntoView();", current_element)
        time.sleep(1)  # 스크롤링을 위한 대기시간

        if current_element.is_displayed() and current_element.is_enabled():
            product_name = current_element.find_element(By.XPATH, ".//div/span/h3").text
            product_price = current_element.find_element(By.XPATH, ".//div/div/em").text
            thumbnail = current_element.find_element(By.CLASS_NAME, "c-gTCeuK").find_element(By.TAG_NAME, "img").get_attribute("src")

            product_info = {
                "product_name": product_name,
                "product_price": product_price,
                "thumbnail": thumbnail
            }
            csv_data.append(product_info)

            current_element.click()
            time.sleep(3)  # 페이지 로딩을 위해 대기

             # product_name = wait.until(EC.presence_of_element_located((By.XPATH, '//*[@id="__next"]/span[2]/div/div/main/div[1]/section[1]/div/div[1]/div[2]/h1')))
            product_img = wait.until(EC.presence_of_element_located((By.XPATH, '//*[@id="__next"]/span[2]/div/div/main/section[1]/div[2]/div/div[2]/div[2]/div/div/picture[1]/img')))
            product_img_src = product_img.get_attribute('src')

            csv_data[-1]['product_img'] = product_img_src


            driver.back()  # 뒤로 가기

            wait.until(EC.presence_of_element_located((By.CLASS_NAME, 'c-dYjrYg')))  # 페이지 로딩 대기
        else:
            print("요소 클릭이 불가능합니다.")
    except Exception as e:
        print(f"클릭할 수 없는 요소 발견: {e}")

# CSV 파일에 데이터 저장
csv_file = 'C:/6산대특/petfriends/treat_bread.csv'
try:
    with open(csv_file, 'w', newline='', encoding='utf-8') as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=['product_name', 'product_price', 'thumbnail', 'product_img'])
        writer.writeheader()
        writer.writerows(csv_data)
except IOError:
    print("CSV 파일을 열 수 없습니다.")

# 브라우저 닫기
driver.quit()
