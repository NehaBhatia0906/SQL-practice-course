-- DATA CLEANING PROJECT
SELECT * FROM layoffs;

-- 1. Remove Duplicates if any
-- 2. Standardize the data
-- 3. Null values
-- 4. Remove any columns

#creating a staging table is the best practice rather than working on the raw data
CREATE TABLE layoffs_staging LIKE layoffs;
SELECT * FROM layoffs_staging;
INSERT layoffs_staging 
SELECT * FROM layoffs;

-- 1. Removing duplicates
SELECT *, ROW_NUMBER() OVER(
PARTITION BY company,industry,total_laid_off,percentage_laid_off,`date`) AS row_num
FROM layoffs_staging;

WITH duplicate_cte AS 
(
SELECT *, ROW_NUMBER() OVER(
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte 
WHERE row_num>1;
#Best to partition using every attribute

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` text,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` text,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * FROM layoffs_staging2;
INSERT INTO layoffs_staging2
SELECT *, ROW_NUMBER() OVER(
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) AS row_num
FROM layoffs_staging;

SELECT * FROM layoffs_staging2 WHERE row_num>1;
DELETE FROM layoffs_staging2 WHERE row_num>1;

SET SQL_SAFE_UPDATES = 0;

-- 2. standardizing data
SELECT company, TRIM(company) FROM layoffs_staging2;
UPDATE layoffs_staging2 SET company = TRIM(company);

SELECT DISTINCT industry FROM layoffs_staging2 ORDER BY 1;

# the below query is commented out because its correctly written and relevant to my database but not executionable
# UPDATE layoffs_staging2 SET industry = 'Crypto' WHERE industry LIKE 'Crypto%';

SELECT DISTINCT location FROM layoffs_staging2 ORDER BY 1;

SELECT DISTINCT country FROM layoffs_staging2 ORDER BY 1;
SELECT * FROM layoffs_staging2 WHERE country LIKE 'United States%' ORDER BY 1;
SELECT DISTINCT country, TRIM(TRAILING '.' FROM country) FROM layoffs_staging2 ORDER BY 1;
UPDATE layoffs_staging2 SET country = TRIM(TRAILING '.' FROM country)  WHERE country LIKE 'United States%';

SELECT `date`, str_to_date(`date`, '%m/%d/%Y') FROM layoffs_staging2;
UPDATE layoffs_staging2 SET `date` = str_to_date(`date`, '%m/%d/%Y') ;
ALTER TABLE layoffs_staging2 MODIFY COLUMN `date` DATE;

-- NULL or BLANK values
SELECT * FROM layoffs_staging2 WHERE industry IS NULL OR industry = '';
SELECT * FROM layoffs_staging2 WHERE company = 'Airbnb';
SELECT * FROM layoffs_staging2 WHERE company = "Bally's Interactive";

#In such cases use self join but since my dataset is incomplete i will update the results manually
SELECT t1.industry,t2.industry 
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
WHERE (t1.industry IS NULL OR t1.industry='')
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2
SET industry = 'Travel'
WHERE company = 'Airbnb'
AND (industry IS NULL OR industry = '');

UPDATE layoffs_staging2
SET industry = 'Unknown'
WHERE company = "Bally's Interactive";

-- 4. Deleting Rows and Columns
SELECT * FROM layoffs_staging2 WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL;
DELETE FROM layoffs_staging2 WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL;

ALTER TABLE layoffs_staging2 DROP COLUMN row_num;







