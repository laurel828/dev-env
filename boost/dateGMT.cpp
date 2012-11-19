#include <iostream>
#include <string>
#include <sstream>
#include <list>

#include <iostream>
#include "boost/date_time/gregorian/gregorian.hpp"
#include "boost/date_time/posix_time/posix_time.hpp"

using namespace std;
using namespace boost::posix_time;
using namespace boost::gregorian;

int main()
{
    date         sToday(day_clock::local_day());
    stringstream sMidNightGMT;

    sMidNightGMT << sToday.day_of_week() << ", " << sToday.day() << " "
                 << sToday.month() << " " << sToday.year() << " "
                 << "15:00:00 GMT";

    cout << sMidNightGMT.str() << endl;

    ptime now = second_clock::local_time();
    ptime tomorrow(now.date() + date_duration(1));

    time_period period(now, tomorrow);
    cout << period.length().total_seconds() << endl;

    time_t t;

    time(&t);
    struct tm * calender = localtime(&t);

    calender->tm_hour = 23;
    calender->tm_min  = 59;
    calender->tm_sec  = 59;

    double remain_secs = difftime(mktime(calender), t);

    t += (time_t)remain_secs;

    cout << remain_secs << endl;
    cout << asctime(calender) << endl;
    cout << ctime(&t) << endl;

    return 0;
}
