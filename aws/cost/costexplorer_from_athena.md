


## s3

daily cost s3
```sql
SELECT line_item_resource_id,
	floor(sum(line_item_blended_cost)) cost
FROM aws_cost_report
WHERE line_item_product_code = 'AmazonS3'
	and year = date_format(current_timestamp - interval '1' day, '%Y')
	and month = date_format(current_timestamp - interval '1' day, '%c')
	-- exclude TAX
	and line_item_tax_type = ''
	-- yesterday1 day
	and line_item_usage_start_date between 
	-- 2022-01-01 00:00:00.000
	date_parse(
		date_format(
			current_timestamp - interval '1' day,
			'%Y-%m-%d'
		),
		'%Y-%m-%d'
	) and 
	-- 2022-01-01 23:59:59.000
	date_parse(
		date_format(current_timestamp, '%Y-%m-%d'),
		'%Y-%m-%d'
	) - interval '1' second 
	--	and line_item_usage_start_date between date_parse('2022-01-12 01', '%Y-%m-%d %H') and date_parse('2022-01-12 02', '%Y-%m-%d %H') - interval '1' second 
	--	and line_item_usage_start_date = date '2022-01-30'
group by line_item_resource_id
order by cost desc
```


https://prestodb.io/docs/0.217/functions/datetime.html#id2 
