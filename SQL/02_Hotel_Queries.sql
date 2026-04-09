--Q1 Last Booked Room 
SELECT room_no, booking_date
FROM bookings
ORDER BY booking_date DESC
LIMIT 1;

--Q2 Billing In November 
SELECT bookings.booking_id, SUM(booking_commercials.item_quantity * items.item_rate) AS total_bill
FROM bookings JOIN booking_commercials ON bookings.booking_id = booking_commercials.booking_id
JOIN items ON booking_commercials.item_id = items.item_id
WHERE strftime('%m', bookings.booking_date) = '11'
GROUP BY bookings.booking_id;

--Q3 Bills > 1000
SELECT bookings.booking_id, SUM(booking_commercials.item_quantity * items.item_rate) AS total_bill
FROM bookings JOIN booking_commercials ON bookings.booking_id = booking_commercials.booking_id
JOIN items ON booking_commercials.item_id = items.item_id
GROUP BY bookings.booking_id
HAVING total_bill > 1000;

--Q4 Most ordered item 
SELECT items.item_name, SUM(booking_commercials.item_quantity) AS total_ordered
FROM booking_commercials 
JOIN items ON booking_commercials.item_id = items.item_id
GROUP BY items.item_name
ORDER BY total_ordered DESC;

--Q5 2nd Highest Bill 
SELECT booking_id, total_bill
FROM (
    SELECT 
        bookings.booking_id,
        SUM(booking_commercials.item_quantity * items.item_rate) AS total_bill
    FROM bookings
    JOIN booking_commercials 
        ON bookings.booking_id = booking_commercials.booking_id
    JOIN items 
        ON booking_commercials.item_id = items.item_id
    GROUP BY bookings.booking_id
    ORDER BY total_bill DESC
    LIMIT 2
)
ORDER BY total_bill ASC
LIMIT 1;