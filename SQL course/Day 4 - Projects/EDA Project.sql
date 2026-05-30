-- EXPLORATORY DATA ANALYSIS
SELECT * FROM layoffs_staging2;
SELECT MAX(total_laid_off),MAX(percentage_laid_off) FROM layoffs_staging2;
SELECT * FROM layoffs_staging2 WHERE percentage_laid_off=1;

SELECT company,SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company 
ORDER BY 2 DESC;

SELECT country,SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country 
ORDER BY 2 DESC;
 
SELECT MIN(`date`),MAX(`date`) FROM layoffs_staging2;

SELECT SUBSTRING(`date`,1,7) AS `MONTH`,SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC;

#Rolling total
WITH Rolling_total AS
(
SELECT SUBSTRING(`date`,1,7) AS `MONTH`,SUM(total_laid_off) AS laid_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`,laid_off,SUM(laid_off) OVER(ORDER BY `MONTH`) FROM Rolling_total;

#Rank the company which laid off the most by years
WITH Company_year(company,years,total_laid_off) AS
(
SELECT company,YEAR(`date`),SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company,YEAR(`date`)
)
SELECT *,DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) FROM Company_year;

