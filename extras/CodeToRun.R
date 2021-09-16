#remotes::install_github("OHDSI/Andromeda",ref="b3cd1d50605c3344faa0f15f57f930e0666f3519")

#remotes::install_github("OHDSI/PheValuator")
#remotes::install_github("OHDSI/CohortDiagnostics")
#remotes::install_github("OHDSI/OhdsiRTools")

# Load the package

library(xlsx)
library(openxlsx)
library(PheValuator)
library(covidPhenotypesTest)

# IF you see an Error: database or disk is full error, consider downgrading Andromeda using below:

options(andromedaTempFolder = "./tmp")

outputFolder <- "./output" #or specify your own output path


user <- "Type your data here"
password <- "Type your data here"
dbms <- "Type your data here"
port <- "Type your data here"
server <- "Type your data here"
schema <- "Type your data here"



# Details for connecting to the server:
connectionDetails <- DatabaseConnector::createConnectionDetails(
  dbms = dbms,
  server = server,
  user = user,
  password = password,
  port = port,
  pathToDriver = "Type your data here")

# For Oracle: define a schema that can be used to emulate temp tables:
oracleTempSchema <- NULL

# Details specific to the database:
cdmDatabaseSchema <- "Type your data here"
cohortDatabaseSchema <- "Type your data here"
cohortTable <- "Type your data here" 

# Run phenotype analysis
covidPhenotypesTest::runPhenoTest(
  connectionDetails = connectionDetails,
  cdmDatabaseSchema = cdmDatabaseSchema,
  cohortDatabaseSchema = cohortDatabaseSchema,
  cohortTable = cohortTable,
  oracleTempSchema = oracleTempSchema,
  outputFolder = outputFolder,
  databaseId = NA,
  databaseName = NA,
  databaseDescription = databaseDescription,
  createCohorts = T,
  runSimpleMonthly = T,
  runOverlap = T,
  runPhevaluator = T,
  minCellCount = 5
)
