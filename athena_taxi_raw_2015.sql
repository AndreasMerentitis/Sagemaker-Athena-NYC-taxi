WITH 
    dataset AS 
    (SELECT CAST (pickup_datetime AS TIMESTAMP WITH time zone) AT TIME ZONE 'America/New_York' AS est, 
                  ST_POINT(pickup_longitude,pickup_latitude) pickup_point,
                  ST_POINT(dropoff_longitude,dropoff_latitude) dropoff_point,
                  to_unixtime( CAST (pickup_datetime AS TIMESTAMP WITH time zone) AT TIME ZONE 'America/New_York') AS                     epoch,
                  24*60*60 as seconds_in_day,
                  *
     FROM raw_data)
    
     SELECT
     
        -- Target
        fare_amount,
        
        -- time features
        day(est) day,
        day_of_week(est) dayofweek ,
        year(est) year ,
        month(est) month ,
        day_of_month(est) dayofmonth ,
        hour(est) hour ,
        minute(est) minute ,
         
        -- cyclclical variables
        sin(2*pi()*epoch/seconds_in_day) sin_day,
        cos(2*pi()*epoch/seconds_in_day) cos_day,
        sin(2*pi()*epoch/(seconds_in_day*7)) sin_week,
        cos(2*pi()*epoch/(seconds_in_day*7)) cos_week,
     
        -- Raw features
        pickup_datetime,
        pickup_longitude,
        pickup_latitude,
        dropoff_longitude,
        dropoff_latitude,
        passenger_count
         
    FROM dataset
    Where year(est) = 2015
