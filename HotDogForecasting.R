## ----setup, include = FALSE--------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(xts)
library(forecast)
library(tsbox)
library(ggplot2)
library(knitr)
library(tidyverse)
library(astsa)
library(prophet)

hotdogs_data <- read.csv(file='Chevron_2021_Datathon_Challenge/Chevron_2021_Datathon_Challenge/filesForStartOfDatathon/training.csv')


df_1_1 <- hotdogs_data %>% filter(StoreNumber==1000, X3HourBucket==1)
df_1_2 <- hotdogs_data %>% filter(StoreNumber==1000, X3HourBucket==2)
df_1_3 <- hotdogs_data %>% filter(StoreNumber==1000, X3HourBucket==3)
df_1_4 <- hotdogs_data %>% filter(StoreNumber==1000, X3HourBucket==4)
df_2_1 <- hotdogs_data %>% filter(StoreNumber==2000, X3HourBucket==1)
df_2_2 <- hotdogs_data %>% filter(StoreNumber==2000, X3HourBucket==2)
df_2_3 <- hotdogs_data %>% filter(StoreNumber==2000, X3HourBucket==3)
df_2_4 <- hotdogs_data %>% filter(StoreNumber==2000, X3HourBucket==4)
df_3_1 <- hotdogs_data %>% filter(StoreNumber==3000, X3HourBucket==1)
df_3_2 <- hotdogs_data %>% filter(StoreNumber==3000, X3HourBucket==2)
df_3_3 <- hotdogs_data %>% filter(StoreNumber==3000, X3HourBucket==3)
df_3_4 <- hotdogs_data %>% filter(StoreNumber==3000, X3HourBucket==4)
df_4_1 <- hotdogs_data %>% filter(StoreNumber==4000, X3HourBucket==1)
df_4_2 <- hotdogs_data %>% filter(StoreNumber==4000, X3HourBucket==2)
df_4_3 <- hotdogs_data %>% filter(StoreNumber==4000, X3HourBucket==3)
df_4_4 <- hotdogs_data %>% filter(StoreNumber==4000, X3HourBucket==4)
m_1_1 <- prophet(df_1_1, seasonality.mode = 'multiplicative')
m_1_2 <- prophet(df_1_2, seasonality.mode = 'multiplicative')
m_1_3 <- prophet(df_1_3, seasonality.mode = 'multiplicative')
m_1_4 <- prophet(df_1_4, seasonality.mode = 'multiplicative')
m_2_1 <- prophet(df_2_1, seasonality.mode = 'multiplicative')
m_2_2 <- prophet(df_2_2, seasonality.mode = 'multiplicative')
m_2_3 <- prophet(df_2_3, seasonality.mode = 'multiplicative')
m_2_4 <- prophet(df_2_4, seasonality.mode = 'multiplicative')
m_3_1 <- prophet(df_3_1, seasonality.mode = 'multiplicative')
m_3_2 <- prophet(df_3_2, seasonality.mode = 'multiplicative')
m_3_3 <- prophet(df_3_3, seasonality.mode = 'multiplicative')
m_3_4 <- prophet(df_3_4, seasonality.mode = 'multiplicative')
m_4_1 <- prophet(df_4_1, seasonality.mode = 'multiplicative')
m_4_2 <- prophet(df_4_2, seasonality.mode = 'multiplicative')
m_4_3 <- prophet(df_4_3, seasonality.mode = 'multiplicative')
m_4_4 <- prophet(df_4_4, seasonality.mode = 'multiplicative')

future_1_1 <- make_future_dataframe(m_1_1, periods = 7)
fcst_1_1 <- predict(m_1_1, future_1_1)

future_1_2 <- make_future_dataframe(m_1_2, periods = 7)
fcst_1_2 <- predict(m_1_2, future_1_2)

future_1_3 <- make_future_dataframe(m_1_3, periods = 7)
fcst_1_3 <- predict(m_1_3, future_1_3)

future_1_4 <- make_future_dataframe(m_1_4, periods = 7)
fcst_1_4 <- predict(m_1_4, future_1_4)

future_2_1 <- make_future_dataframe(m_2_1, periods = 7)
fcst_2_1 <- predict(m_2_1, future_2_1)

future_2_2 <- make_future_dataframe(m_2_2, periods = 7)
fcst_2_2 <- predict(m_2_2, future_2_2)

future_2_3 <- make_future_dataframe(m_2_3, periods = 7)
fcst_2_3 <- predict(m_2_3, future_2_3)

future_2_4 <- make_future_dataframe(m_2_4, periods = 7)
fcst_2_4 <- predict(m_2_4, future_2_4)

future_3_1 <- make_future_dataframe(m_3_1, periods = 7)
fcst_3_1 <- predict(m_3_1, future_3_1)

future_3_2 <- make_future_dataframe(m_3_2, periods = 7)
fcst_3_2 <- predict(m_3_2, future_3_2)

future_3_3 <- make_future_dataframe(m_3_3, periods = 7)
fcst_3_3 <- predict(m_3_3, future_3_3)

future_3_4 <- make_future_dataframe(m_3_4, periods = 7)
fcst_3_4 <- predict(m_3_4, future_3_4)

future_4_1 <- make_future_dataframe(m_4_1, periods = 7)
fcst_4_1 <- predict(m_4_1, future_4_1)

future_4_2 <- make_future_dataframe(m_4_2, periods = 7)
fcst_4_2 <- predict(m_4_2, future_4_2)

future_4_3 <- make_future_dataframe(m_4_3, periods = 7)
fcst_4_3 <- predict(m_4_3, future_4_3)

future_4_4 <- make_future_dataframe(m_4_4, periods = 7)
fcst_4_4 <- predict(m_4_4, future_4_4)

fcst_1 <- rbind(fcst_1_1, fcst_1_2, fcst_1_3, fcst_1_4)
fcst_1 <- fcst_1[order(fcst_1$ds),]
fcst_2 <- rbind(fcst_2_1, fcst_2_2, fcst_2_3, fcst_2_4)
fcst_2 <- fcst_2[order(fcst_2$ds),]
fcst_3 <- rbind(fcst_3_1, fcst_3_2, fcst_3_3, fcst_3_4)
fcst_3 <- fcst_3[order(fcst_3$ds),]
fcst_4 <- rbind(fcst_4_1, fcst_4_2, fcst_4_3, fcst_4_4)
fcst_4 <- fcst_4[order(fcst_4$ds),]