#!/bin/bash

function load_rating()
{
    local PROPERTY_ID=$1
    local DATE_1=$2
    local DATE_2=$3
    local OUTPUT_FILE=$4

    local POST_DATA=""

    POST_DATA+="PROPERTY_ID="$PROPERTY_ID"&"
    POST_DATA+="search[type]=name&"
    POST_DATA+="sort_param=rating&"
    POST_DATA+="sort_order=ASC&"
    POST_DATA+="REGION_ID=0&"
    POST_DATA+="date1="$DATE_1"&"
    POST_DATA+="date2="$DATE_2"&"
    POST_DATA+="IS_SHOW_GROUP=0&"
    POST_DATA+="IS_SHOW_LIABILITIES=0"

    wget -o $OUTPUT_FILE --post-data $POST_DATA -c \
         http://www.banki.ru/banks/ratings/export.php
}

# Активы нетто - активы действительные (реальные) после вычета пассивов
# (долговых обязательств)

NET_ASSETS_ID=10

#wget --post-data 'PROPERTY_ID=10&search[type]=name&sort_param=rating&sort_order=ASC&REGION_ID=0&date1=2016-09-01&date2=2016-01-01&IS_SHOW_GROUP=0&IS_SHOW_LIABILITIES=0' \
#     -c http://www.banki.ru/banks/ratings/export.php


# Чистая прибыль - чистая прибыль до уплаты налогов
# http://www.banki.ru/banks/ratings/export.php?PROPERTY_ID=30&search[type]=name&sort_param=rating&sort_order=ASC&REGION_ID=0&date1=2016-09-01&date2=2016-01-01&IS_SHOW_GROUP=0&IS_SHOW_LIABILITIES=0

NET_PROFIT_ID=30


load_rating NET_ASSETS_ID "2016-09-01" "2016-01-01" "net_assets"
load_rating NET_PROFIT_ID "2016-09-01" "2016-01-01" "net_profit"