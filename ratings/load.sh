#!/bin/bash

function load_rating()
{
    local PROPERTY_ID=$1
    local DATE_1=$2
    local DATE_2=$3
    local OUTPUT_FILE=$4"__"$DATE_1"__"$DATE_2

    local URL="http://www.banki.ru/banks/ratings/export.php"
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

    echo "loading "$OUTPUT_FILE"..."

    wget -q -O - --post-data $POST_DATA -c $URL | \
    iconv -f WINDOWS-1251 -t UTF-8 > $OUTPUT_FILE
}

# Активы нетто - активы действительные (реальные) после вычета пассивов
# (долговых обязательств)

NET_ASSETS_ID=10

# Чистая прибыль - чистая прибыль до уплаты налогов

NET_PROFIT_ID=30


load_rating $NET_ASSETS_ID "2016-01-01" "2016-09-01" "net-assets"
load_rating $NET_ASSETS_ID "2016-09-01" "2016-01-01" "net-assets"


#load_rating $NET_PROFIT_ID "2016-01-01" "2016-09-01" "net-profit"