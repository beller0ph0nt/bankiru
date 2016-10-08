#!/bin/bash


# Активы нетто
# http://www.banki.ru/banks/ratings/export.php?PROPERTY_ID=10&search[type]=name&sort_param=rating&sort_order=ASC&REGION_ID=0&date1=2016-09-01&date2=2016-01-01&IS_SHOW_GROUP=0&IS_SHOW_LIABILITIES=0

wget --post-data 'PROPERTY_ID=10&search[type]=name&sort_param=rating&sort_order=ASC&REGION_ID=0&date1=2016-09-01&date2=2016-01-01&IS_SHOW_GROUP=0&IS_SHOW_LIABILITIES=0' \
     -c http://www.banki.ru/banks/ratings/export.php


# Чистая прибыль
# http://www.banki.ru/banks/ratings/export.php?PROPERTY_ID=30&search[type]=name&sort_param=rating&sort_order=ASC&REGION_ID=0&date1=2016-09-01&date2=2016-01-01&IS_SHOW_GROUP=0&IS_SHOW_LIABILITIES=0