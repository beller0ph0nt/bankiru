#!/bin/bash

CUR_DIR=`pwd`
RATING_DIR=$CUR_DIR"/ratings"

if [ ! -d "$RATIING_DIR" ]; then
    mkdir $RATING_DIR
fi

function load_rating()
{
    local PROPERTY_ID=$1
    local DATE_FROM=$2
    local DATE_TO=$3
    local OUTPUT_FILE=$4"__"$DATE_FROM"__"$DATE_TO

    local URL="http://www.banki.ru/banks/ratings/export.php"
    local POST_DATA=""

    POST_DATA+="PROPERTY_ID="$PROPERTY_ID"&"
    POST_DATA+="search[type]=name&"
    POST_DATA+="sort_param=rating&"
    POST_DATA+="sort_order=ASC&"
    POST_DATA+="REGION_ID=0&"
    POST_DATA+="date1="$DATE_TO"&"
    POST_DATA+="date2="$DATE_FROM"&"
    POST_DATA+="IS_SHOW_GROUP=0&"
    POST_DATA+="IS_SHOW_LIABILITIES=0"

    echo "loading "$OUTPUT_FILE"..."

    wget -q -O - --post-data $POST_DATA -c $URL | \
    iconv -f WINDOWS-1251 -t UTF-8 | \
    sed -e 's/\r//' > $RATING_DIR"/"$OUTPUT_FILE
}

# Активы нетто - активы действительные (реальные) после вычета пассивов (долговых обязательств)
NET_ASSETS_ID=10

# Капитал - (собственные средства) необходим для того, чтобы в случае неожиданных финансовых
# потерь и даже ожидаемых убытков обеспечить банку исполнение всех обязательств перед
# кредиторами и акционерами
#CAPITAL_ID=25

# Чистая прибыль - чистая прибыль до уплаты налогов
NET_PROFIT_ID=30

# Кредитный портфель - совокупность кредитов, выданных банком.
CREDIT_PORTFOLIO_ID=40

# Вклады физических лиц - денежные средства физических лиц, размещенные на счетах в
# коммерческих банках на определенных условиях
DEPOSITS_ID=60




# 2008
load_rating $NET_ASSETS_ID       "2008-01-01" "2008-12-01" "net-assets"
#load_rating $CAPITAL_ID          "2008-01-01" "2008-12-01" "capital"
load_rating $NET_PROFIT_ID       "2008-01-01" "2008-12-01" "net-profit"
load_rating $CREDIT_PORTFOLIO_ID "2008-01-01" "2008-12-01" "credit-portfolio"
load_rating $DEPOSITS_ID         "2008-01-01" "2008-12-01" "deposits"

# 2009
load_rating $NET_ASSETS_ID       "2009-01-01" "2009-12-01" "net-assets"
#load_rating $CAPITAL_ID          "2009-01-01" "2009-12-01" "capital"
load_rating $NET_PROFIT_ID       "2009-01-01" "2009-12-01" "net-profit"
load_rating $CREDIT_PORTFOLIO_ID "2009-01-01" "2009-12-01" "credit-portfolio"
load_rating $DEPOSITS_ID         "2009-01-01" "2009-12-01" "deposits"

# 2010
load_rating $NET_ASSETS_ID       "2010-01-01" "2010-12-01" "net-assets"
#load_rating $CAPITAL_ID          "2010-01-01" "2010-12-01" "capital"
load_rating $NET_PROFIT_ID       "2010-01-01" "2010-12-01" "net-profit"
load_rating $CREDIT_PORTFOLIO_ID "2010-01-01" "2010-12-01" "credit-portfolio"
load_rating $DEPOSITS_ID         "2010-01-01" "2010-12-01" "deposits"

# 2011
load_rating $NET_ASSETS_ID       "2011-01-01" "2011-12-01" "net-assets"
#load_rating $CAPITAL_ID          "2011-01-01" "2011-12-01" "capital"
load_rating $NET_PROFIT_ID       "2011-01-01" "2011-12-01" "net-profit"
load_rating $CREDIT_PORTFOLIO_ID "2011-01-01" "2011-12-01" "credit-portfolio"
load_rating $DEPOSITS_ID         "2011-01-01" "2011-12-01" "deposits"

# 2012
load_rating $NET_ASSETS_ID       "2012-01-01" "2012-12-01" "net-assets"
#load_rating $CAPITAL_ID          "2012-01-01" "2012-12-01" "capital"
load_rating $NET_PROFIT_ID       "2012-01-01" "2012-12-01" "net-profit"
load_rating $CREDIT_PORTFOLIO_ID "2012-01-01" "2012-12-01" "credit-portfolio"
load_rating $DEPOSITS_ID         "2012-01-01" "2012-12-01" "deposits"

# 2013
load_rating $NET_ASSETS_ID       "2013-01-01" "2013-12-01" "net-assets"
#load_rating $CAPITAL_ID          "2013-01-01" "2013-12-01" "capital"
load_rating $NET_PROFIT_ID       "2013-01-01" "2013-12-01" "net-profit"
load_rating $CREDIT_PORTFOLIO_ID "2013-01-01" "2013-12-01" "credit-portfolio"
load_rating $DEPOSITS_ID         "2013-01-01" "2013-12-01" "deposits"

# 2014
load_rating $NET_ASSETS_ID       "2014-01-01" "2014-12-01" "net-assets"
#load_rating $CAPITAL_ID          "2014-01-01" "2014-12-01" "capital"
load_rating $NET_PROFIT_ID       "2014-01-01" "2014-12-01" "net-profit"
load_rating $CREDIT_PORTFOLIO_ID "2014-01-01" "2014-12-01" "credit-portfolio"
load_rating $DEPOSITS_ID         "2014-01-01" "2014-12-01" "deposits"

# 2015
load_rating $NET_ASSETS_ID       "2015-01-01" "2015-12-01" "net-assets"
#load_rating $CAPITAL_ID          "2015-01-01" "2015-12-01" "capital"
load_rating $NET_PROFIT_ID       "2015-01-01" "2015-12-01" "net-profit"
load_rating $CREDIT_PORTFOLIO_ID "2015-01-01" "2015-12-01" "credit-portfolio"
load_rating $DEPOSITS_ID         "2015-01-01" "2015-12-01" "deposits"

#2016
load_rating $NET_ASSETS_ID       "2016-01-01" "2016-09-01" "net-assets"
#load_rating $CAPITAL_ID          "2016-01-01" "2016-09-01" "capital"
load_rating $NET_PROFIT_ID       "2016-01-01" "2016-09-01" "net-profit"
load_rating $CREDIT_PORTFOLIO_ID "2016-01-01" "2016-09-01" "credit-portfolio"
load_rating $DEPOSITS_ID         "2016-01-01" "2016-09-01" "deposits"