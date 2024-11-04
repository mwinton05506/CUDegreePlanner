from bs4 import BeautifulSoup
import requests

def scrapeCourses():
    pageToScrape = requests.get("https://catalog.colorado.edu/courses-a-z/csci/")
    soup = BeautifulSoup(pageToScrape.text, "html.parser")
    courses = soup.findAll('p', attrs = {'class':'courseblocktitle noindent'})
    
    i = 1
    for courses in courses:
        print(courses.text)
        # i+=1

scrapeCourses()