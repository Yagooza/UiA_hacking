import requests, re


r = requests.get('https://links.datapor.no/')

string = ''

# Visit the site https://links.datapor.no (Lenker til en ekstern side.)
# with the use of requests and print out the source code.
def task_1():
    print(r.text)



# How many links are using http vs https , with the use of regex.
def task_2():
    c_http = 0
    c_https = 0
    http = re.findall("http", r.text)
    https = re.findall("https", r.text)
    for number in http:
        c_http += 1
    for number in https:
        c_https += 1

    print('Number of links using "http"  is: ', c_http,
          '\nNumber of links using "https" is: ', c_https)


# Print out all the unique TLD
def task_3():
    tld_array = []
    tld = re.findall('[.](?:[a-z])*/', r.text)  #alt mellom . og /
    for tlds in tld:
        tld_array.append(tlds)

    list_set = set(tld_array)
    unique_list = list(list_set)
    for x in unique_list:
        print(x)


# print out all the unique hostname for each url.
def task_4():
    url = re.findall('://(?:[a-zA-Z][^www]|[$-_@+])+', r.text)
    url_array = []
    urls_split = re.split("://", str(url))
    for urls in urls_split:
        urls = re.split('[.](?:[a-z])*/', str(urls))[0]
        if urls not in url_array:
            url_array.append(urls)
    #url_array = re.split('.no', str(url_array))
    for x in url_array:
        print(x)


# Find all the unique html tags, with the use of regex
def task_5():
    array = []
    html_tags = re.findall('<[^/>][^>]*>', r.text)

    for tags in html_tags:
        tags = re.split('\s', str(tags))[0]
        array.append(tags)

    list_set = set(array)
    unique_list = list(list_set)
    for x in unique_list:
        print(x)


# Visit each of the links found on https://links.datapor.no (Lenker til en ekstern side.),
# and visit each of the links and print out the title of the site *hint: look for <title> or <meta> tags*
def task_6():
    urls = re.findall('http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+', r.text)
    for hosts in urls:
        host_all = requests.get(hosts)
        titles = re.findall("<title[^>]*>([^<]+)</title>",host_all.text)
        for title in titles:
            print(title)


if __name__ == "__main__":
    task_1()
    task_2()
    task_3()
    task_4()
    task_5()
    task_6()
