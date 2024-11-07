from bs4 import BeautifulSoup
import requests

def scrapeReqs():
    pageToScrape = requests.get("https://catalog.colorado.edu/courses-a-z/csci/")
    soup = BeautifulSoup(pageToScrape.text, "html.parser")
    desc = soup.findAll('p', attrs = {'class':'courseblockextra noindent'})
    
    i = 1
    for desc in desc:
        print(desc.text)
        i+=1

scrapeReqs()