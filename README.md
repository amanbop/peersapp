## Zip to MSA

## Intro

Simple Rails app to load data from CSV files and retrieve specific values (MSA for a ZIP in this case)

### Installation

### 1. Clone this git repo

``` git clone https://address/to/this/repo ```

### 2: Install needed gems in Gemfile

``` cd peersaap ``` or the dir name you cloned it into

``` bundle install ```

### 3: Run rails server

``` rails s ```

## Usage

#### 1. Send a get call to API url with parameters

``` curl get 'http://localhost:3000/api/v1/zips_data?zip_list=90266,32003,88340,88338' ```

or 

Simply browse to url http://localhost:3000/api/v1/zips_data?zip_list=90266,32003,88340,88338 using any browser

#### 2. Output

API will return the data in JSON format e.g.

``` [{"zip":"90266","cbsa":"31080","msa":"Los Angeles-Long Beach-Anaheim, CA","pop2015":"13340068","pop2014":"13254397"},{"zip":"32003","cbsa":"27260","msa":"Jacksonville, FL","pop2015":"1449481","pop2014":"1421004"},{"zip":"88340","cbsa":"10460","msa":"N/A","pop2015":"N/A","pop2014":"N/A"},{"zip":"88338","cbsa":"N/A","msa":"N/A","pop2015":"N/A","pop2014":"N/A"}] ```

#### 3. Run unit tests

``` bundle exec rspec ```