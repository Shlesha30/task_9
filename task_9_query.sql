create or replace function getProfitPercentage(productID varchar)
RETURNS double precision AS $$
	DECLARE
	sum_of_sales double precision;
	sum_of_profit double precision;
	ProfitPercentage double precision;
BEGIN
	select sum(sales) as sum_of_sales,sum(profit) as sum_of_profit into sum_of_sales,sum_of_profit
	from sales where product_id= productID;
    ProfitPercentage := (sum_of_profit /sum_of_sales) *100;
	return ProfitPercentage;

END;
$$ LANGUAGE plpgsql;

select getProfitPercentage('FUR-BO-10001798')

select *, getprofitpercentage(product_id) from sales
