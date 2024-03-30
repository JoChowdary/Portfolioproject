--select date, iso_code, continent, location, population
--from ..covid_data;

select date, iso_code, continent, location, population
from ..covid_data
where location like '%dia%';

--total number of cases by total number of deaths

select date, continent, location, population, total_cases, total_deaths, (total_deaths/total_cases)*100 as deathpercentage
from dbo.covid_data2
where location like '%states'
order by 1,2;

--Looking for total cases vs population

select location, date, total_cases, total_deaths, population, (total_cases/population)*100 as affectedpercentage
from dbo.covid_data2
where location like '%states'
order by 1,2;

--Looking at countries with highest infection rate compared to population

select location, population, max(total_cases) as Highestinfectioncount, max(total_cases/population)*100 as percentpopulationinfected
from dbo.covid_data2
--where location like '%states%'
group by location, population
order by percentpopulationinfected desc;

--showing countries with highest death count per population

select location, MAX(cast(total_deaths as int)) as totaldeathcount
from dbo.covid_data2
--where location like '%states%'
group by location
order by totaldeathcount desc;

select location, MAX(cast(total_deaths as int)) as totaldeathcount
from dbo.covid_data2
--where location like '%states%'
where continent is not null
group by location
order by totaldeathcount desc;

-- Doing data exploration by continent

select continent, MAX(cast(total_deaths as int)) as totaldeathcount
from dbo.covid_data2
--where location like '%states%'
where continent is not null
group by continent
order by totaldeathcount desc;

-- showing the continents with the highest death count per population

select continent, MAX(cast(total_deaths as int)) as totaldeathcount
from dbo.covid_data2
--where location like '%states%'
where continent is not null
group by continent
order by totaldeathcount desc


--Globally

select sum(new_cases) as newcases, sum(new_deaths) as newdeaths, Sum(new_deaths)/sum(new_cases)*100 as deathpercentage
from dbo.covid_data2
--where location like '%states'
where location is not null
group by location
order by 1,2;

delete from dbo.covid_data2 where location = 'North Korea' or location ='Turkmenistan';


select location, sum(new_cases) as newcases, sum(new_deaths) as newdeaths from dbo.covid_data2 group by location;

--SELECT 
    SUM(new_cases) AS total_new_cases,
    SUM(new_deaths) AS total_new_deaths,
    (SUM(new_deaths) / SUM(new_cases)) * 1100 AS death_rate_per_thousand
--FROM 
    dbo.covid_data2;






