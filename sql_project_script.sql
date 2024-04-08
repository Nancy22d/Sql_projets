/* 1.Determine the number of drugs approved each year and provide insights into the yearly 
trends.*/
SELECT YEAR(ActionDate) AS Approval_Year, COUNT(*) AS Number_of_Approvals
FROM regactiondate
GROUP BY YEAR(ActionDate);

/*2. Identify the top three years that got the highest and lowest approvals, in descending and 
ascending order, respectively.*/
/*highest*/

SELECT YEAR(ActionDate) AS Approval_Year, COUNT(*) AS Number_of_Approvals
FROM regactiondate
GROUP BY YEAR(ActionDate)
ORDER BY Number_of_Approvals DESC
LIMIT 3;
/*lowest*/
SELECT YEAR(ActionDate) AS Approval_Year, COUNT(*) AS Number_of_Approvals
FROM regactiondate
GROUP BY YEAR(ActionDate)
ORDER BY Number_of_Approvals limit 3;

/*3.Explore approval trends over the years based on sponsors*/
SELECT YEAR(ActionDate) AS Approval_Year, application.SponsorApplicant, COUNT(*) AS Number_of_Approvals
FROM regactiondate
Join application 
on regactiondate.ApplNo = application.ApplNo
GROUP BY YEAR(ActionDate), SponsorApplicant
ORDER BY Approval_Year, Number_of_Approvals DESC;

/*4.Rank sponsors based on the total number of approvals they received each year between 1939 and 1960:*/
SELECT SponsorApplicant, COUNT(*) AS Approvals
FROM application
join regactiondate
on regactiondate.ApplNo = application.ApplNo
WHERE YEAR(ActionDate) BETWEEN 1939 AND 1960
GROUP BY SponsorApplicant
ORDER BY Approvals DESC;

/*5.Group products based on MarketingStatus:*/
SELECT ProductMktStatus, COUNT(*) AS Approvals
FROM product
GROUP BY ProductMktStatus
ORDER BY Approvals DESC;

/*6.Calculate the total number of applications for each MarketingStatus year-wise after the year 2010:*/
SELECT YEAR(ActionDate) AS Year,ProductMktStatus , COUNT(*) AS Approvals
FROM regactiondate
join product 
ON regactiondate.ApplNo=product.ApplNo
WHERE YEAR(ActionDate) > 2010
GROUP BY YEAR(ActionDate),ProductMktStatus 
ORDER BY Year, Approvals DESC;


/*7.Identify the top MarketingStatus with the maximum number of Approvals and analyze its trend over time:*/
SELECT YEAR(ActionDate) AS Year,ProductMktStatus, COUNT(*) AS Approvals
FROM regactiondate
join product
on regactiondate.ApplNo=product.ApplNo
GROUP BY  YEAR(ActionDate),ProductMktStatus
ORDER BY YEAR,Approvals DESC;


/*8.Categorize Products by dosage form and analyze their distribution:*/
SELECT drugname ,Dosage, COUNT(*) AS Approvals
FROM product
GROUP BY drugname,Dosage
ORDER BY Dosage DESC;

/*9.Calculate the total number of approvals for each dosage form and identify the most successful forms:*/

SELECT Dosage, COUNT(*) AS Approvals
FROM product
GROUP BY Dosage
ORDER BY Approvals DESC;


/*10.Investigate yearly trends related to successful forms:*/
SELECT YEAR(ActionDate) AS Year, Dosage, COUNT(*) AS Approvals
FROM regactiondate
join product
on regactiondate.ApplNo=product.ApplNo
GROUP BY YEAR(ActionDate), Dosage
ORDER BY Year, Approvals DESC;


/*11. drug approvals based on therapeutic evaluation code (TE_Code):*/
SELECT TECode, COUNT(*) AS Approvals
FROM product
GROUP BY TECode
ORDER BY Approvals DESC;

/*12.Determine the therapeutic evaluation code (TE_Code) with the highest number of Approvals in each year:*/
SELECT YEAR(ActionDate) AS Year, TECode, COUNT(*) AS Approvals
FROM regactiondate
join product_tecode
on regactiondate.ApplNo=product_tecode.ApplNo
GROUP BY YEAR(ActionDate), TECode
ORDER BY Year, Approvals DESC;


