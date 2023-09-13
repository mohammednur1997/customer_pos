-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pos_nur
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_transactions`
--

DROP TABLE IF EXISTS `account_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `type` enum('debit','credit') NOT NULL,
  `sub_type` enum('opening_balance','fund_transfer','deposit') DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL,
  `reff_no` varchar(191) DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `transaction_payment_id` int(11) DEFAULT NULL,
  `transfer_transaction_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_transactions_account_id_index` (`account_id`),
  KEY `account_transactions_transaction_id_index` (`transaction_id`),
  KEY `account_transactions_transaction_payment_id_index` (`transaction_payment_id`),
  KEY `account_transactions_transfer_transaction_id_index` (`transfer_transaction_id`),
  KEY `account_transactions_created_by_index` (`created_by`),
  KEY `account_transactions_type_index` (`type`),
  KEY `account_transactions_sub_type_index` (`sub_type`),
  KEY `account_transactions_operation_date_index` (`operation_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_transactions`
--

LOCK TABLES `account_transactions` WRITE;
/*!40000 ALTER TABLE `account_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_types`
--

DROP TABLE IF EXISTS `account_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `parent_account_type_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_types_parent_account_type_id_index` (`parent_account_type_id`),
  KEY `account_types_business_id_index` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_types`
--

LOCK TABLES `account_types` WRITE;
/*!40000 ALTER TABLE `account_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounting_acc_trans_mappings`
--

DROP TABLE IF EXISTS `accounting_acc_trans_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_acc_trans_mappings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `ref_no` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `created_by` int(11) NOT NULL,
  `operation_date` datetime NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting_acc_trans_mappings`
--

LOCK TABLES `accounting_acc_trans_mappings` WRITE;
/*!40000 ALTER TABLE `accounting_acc_trans_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounting_acc_trans_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounting_account_types`
--

DROP TABLE IF EXISTS `accounting_account_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_account_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `business_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `account_primary_type` varchar(191) DEFAULT NULL,
  `account_type` varchar(191) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `show_balance` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting_account_types`
--

LOCK TABLES `accounting_account_types` WRITE;
/*!40000 ALTER TABLE `accounting_account_types` DISABLE KEYS */;
INSERT INTO `accounting_account_types` VALUES (1,'accounts_receivable',NULL,NULL,'asset','sub_type',NULL,NULL,0,NULL,NULL),(2,'current_assets',NULL,NULL,'asset','sub_type',NULL,NULL,1,NULL,NULL),(3,'cash_and_cash_equivalents',NULL,NULL,'asset','sub_type',NULL,NULL,1,NULL,NULL),(4,'fixed_assets',NULL,NULL,'asset','sub_type',NULL,NULL,1,NULL,NULL),(5,'non_current_assets',NULL,NULL,'asset','sub_type',NULL,NULL,1,NULL,NULL),(6,'accounts_payable',NULL,NULL,'liability','sub_type',NULL,NULL,0,NULL,NULL),(7,'credit_card',NULL,NULL,'liability','sub_type',NULL,NULL,1,NULL,NULL),(8,'current_liabilities',NULL,NULL,'liability','sub_type',NULL,NULL,1,NULL,NULL),(9,'non_current_liabilities',NULL,NULL,'liability','sub_type',NULL,NULL,1,NULL,NULL),(10,'owners_equity',NULL,NULL,'equity','sub_type',NULL,NULL,1,NULL,NULL),(11,'income',NULL,NULL,'income','sub_type',NULL,NULL,0,NULL,NULL),(12,'other_income',NULL,NULL,'income','sub_type',NULL,NULL,0,NULL,NULL),(13,'cost_of_sale',NULL,NULL,'expenses','sub_type',NULL,NULL,0,NULL,NULL),(14,'expenses',NULL,NULL,'expenses','sub_type',NULL,NULL,0,NULL,NULL),(15,'other_expense',NULL,NULL,'expenses','sub_type',NULL,NULL,0,NULL,NULL),(16,'accounts_receivable',NULL,NULL,NULL,'detail_type',1,'',1,NULL,NULL),(17,'allowance_for_bad_debts',NULL,NULL,NULL,'detail_type',2,'allowance_for_bad_debts_desc',1,NULL,NULL),(18,'assets_available_for_sale',NULL,NULL,NULL,'detail_type',2,'assets_available_for_sale_desc',1,NULL,NULL),(19,'development_costs',NULL,NULL,NULL,'detail_type',2,'development_costs_desc',1,NULL,NULL),(20,'employee_cash_advances',NULL,NULL,NULL,'detail_type',2,'employee_cash_advances_desc',1,NULL,NULL),(21,'inventory',NULL,NULL,NULL,'detail_type',2,'inventory_desc',1,NULL,NULL),(22,'investments_-_other',NULL,NULL,NULL,'detail_type',2,'investments_-_other_desc',1,NULL,NULL),(23,'loans_to_officers',NULL,NULL,NULL,'detail_type',2,'loans_to_officers_desc',1,NULL,NULL),(24,'loans_to_others',NULL,NULL,NULL,'detail_type',2,'loans_to_others_desc',1,NULL,NULL),(25,'loans_to_shareholders',NULL,NULL,NULL,'detail_type',2,'loans_to_shareholders_desc',1,NULL,NULL),(26,'other_current_assets',NULL,NULL,NULL,'detail_type',2,'other_current_assets_desc',1,NULL,NULL),(27,'prepaid_expenses',NULL,NULL,NULL,'detail_type',2,'prepaid_expenses_desc',1,NULL,NULL),(28,'retainage',NULL,NULL,NULL,'detail_type',2,'retainage_desc',1,NULL,NULL),(29,'undeposited_funds',NULL,NULL,NULL,'detail_type',2,'undeposited_funds_desc',1,NULL,NULL),(30,'bank',NULL,NULL,NULL,'detail_type',3,'bank_desc',1,NULL,NULL),(31,'cash_and_cash_equivalents',NULL,NULL,NULL,'detail_type',3,'cash_and_cash_equivalents_desc',1,NULL,NULL),(32,'cash_on_hand',NULL,NULL,NULL,'detail_type',3,'cash_on_hand_desc',1,NULL,NULL),(33,'client_trust_account',NULL,NULL,NULL,'detail_type',3,'client_trust_account_desc',1,NULL,NULL),(34,'money_market',NULL,NULL,NULL,'detail_type',3,'money_market_desc',1,NULL,NULL),(35,'rents_held_in_trust',NULL,NULL,NULL,'detail_type',3,'rents_held_in_trust_desc',1,NULL,NULL),(36,'savings',NULL,NULL,NULL,'detail_type',3,'savings_desc',1,NULL,NULL),(37,'accumulated_depletion',NULL,NULL,NULL,'detail_type',4,'accumulated_depletion_desc',1,NULL,NULL),(38,'accumulated_depreciation_on_property,_plant_and_equipment',NULL,NULL,NULL,'detail_type',4,'accumulated_depreciation_on_property,_plant_and_equipment_desc',1,NULL,NULL),(39,'buildings',NULL,NULL,NULL,'detail_type',4,'buildings_desc',1,NULL,NULL),(40,'depletable_assets',NULL,NULL,NULL,'detail_type',4,'depletable_assets_desc',1,NULL,NULL),(41,'furniture_and_fixtures',NULL,NULL,NULL,'detail_type',4,'furniture_and_fixtures_desc',1,NULL,NULL),(42,'land',NULL,NULL,NULL,'detail_type',4,'land_desc',1,NULL,NULL),(43,'leasehold_improvements',NULL,NULL,NULL,'detail_type',4,'leasehold_improvements_desc',1,NULL,NULL),(44,'machinery_and_equipment',NULL,NULL,NULL,'detail_type',4,'machinery_and_equipment_desc',1,NULL,NULL),(45,'other_fixed_assets',NULL,NULL,NULL,'detail_type',4,'other_fixed_assets_desc',1,NULL,NULL),(46,'vehicles',NULL,NULL,NULL,'detail_type',4,'vehicles_desc',1,NULL,NULL),(47,'accumulated_amortisation_of_non-current_assets',NULL,NULL,NULL,'detail_type',5,'accumulated_amortisation_of_non-current_assets_desc',1,NULL,NULL),(48,'assets_held_for_sale',NULL,NULL,NULL,'detail_type',5,'assets_held_for_sale_desc',1,NULL,NULL),(49,'deferred_tax',NULL,NULL,NULL,'detail_type',5,'deferred_tax_desc',1,NULL,NULL),(50,'goodwill',NULL,NULL,NULL,'detail_type',5,'goodwill_desc',1,NULL,NULL),(51,'intangible_assets',NULL,NULL,NULL,'detail_type',5,'intangible_assets_desc',1,NULL,NULL),(52,'lease_buyout',NULL,NULL,NULL,'detail_type',5,'lease_buyout_desc',1,NULL,NULL),(53,'licences',NULL,NULL,NULL,'detail_type',5,'licences_desc',1,NULL,NULL),(54,'long-term_investments',NULL,NULL,NULL,'detail_type',5,'long-term_investments_desc',1,NULL,NULL),(55,'organisational_costs',NULL,NULL,NULL,'detail_type',5,'organisational_costs_desc',1,NULL,NULL),(56,'other_non-current_assets',NULL,NULL,NULL,'detail_type',5,'other_non-current_assets_desc',1,NULL,NULL),(57,'security_deposits',NULL,NULL,NULL,'detail_type',5,'security_deposits_desc',1,NULL,NULL),(58,'accounts_payable_(a/p)',NULL,NULL,NULL,'detail_type',6,'accounts_payable_(a/p)_desc',1,NULL,NULL),(59,'credit_card',NULL,NULL,NULL,'detail_type',7,'credit_card_desc',1,NULL,NULL),(60,'accrued_liabilities',NULL,NULL,NULL,'detail_type',8,'accrued_liabilities_desc',1,NULL,NULL),(61,'client_trust_accounts_-_liabilities',NULL,NULL,NULL,'detail_type',8,'client_trust_accounts_-_liabilities_desc',1,NULL,NULL),(62,'current_tax_liability',NULL,NULL,NULL,'detail_type',8,'current_tax_liability_desc',1,NULL,NULL),(63,'current_portion_of_obligations_under_finance_leases',NULL,NULL,NULL,'detail_type',8,'current_portion_of_obligations_under_finance_leases_desc',1,NULL,NULL),(64,'dividends_payable',NULL,NULL,NULL,'detail_type',8,'dividends_payable_desc',1,NULL,NULL),(65,'income_tax_payable',NULL,NULL,NULL,'detail_type',8,'income_tax_payable_desc',1,NULL,NULL),(66,'insurance_payable',NULL,NULL,NULL,'detail_type',8,'insurance_payable_desc',1,NULL,NULL),(67,'line_of_credit',NULL,NULL,NULL,'detail_type',8,'line_of_credit_desc',1,NULL,NULL),(68,'loan_payable',NULL,NULL,NULL,'detail_type',8,'loan_payable_desc',1,NULL,NULL),(69,'other_current_liabilities',NULL,NULL,NULL,'detail_type',8,'other_current_liabilities_desc',1,NULL,NULL),(70,'payroll_clearing',NULL,NULL,NULL,'detail_type',8,'payroll_clearing_desc',1,NULL,NULL),(71,'payroll_liabilities',NULL,NULL,NULL,'detail_type',8,'payroll_liabilities_desc',1,NULL,NULL),(72,'prepaid_expenses_payable',NULL,NULL,NULL,'detail_type',8,'prepaid_expenses_payable_desc',1,NULL,NULL),(73,'rents_in_trust_-_liability',NULL,NULL,NULL,'detail_type',8,'rents_in_trust_-_liability_desc',1,NULL,NULL),(74,'sales_and_service_tax_payable',NULL,NULL,NULL,'detail_type',8,'sales_and_service_tax_payable_desc',1,NULL,NULL),(75,'accrued_holiday_payable',NULL,NULL,NULL,'detail_type',9,'accrued_holiday_payable_desc',1,NULL,NULL),(76,'accrued_non-current_liabilities',NULL,NULL,NULL,'detail_type',9,'accrued_non-current_liabilities_desc',1,NULL,NULL),(77,'liabilities_related_to_assets_held_for_sale',NULL,NULL,NULL,'detail_type',9,'liabilities_related_to_assets_held_for_sale_desc',1,NULL,NULL),(78,'long-term_debt',NULL,NULL,NULL,'detail_type',9,'long-term_debt_desc',1,NULL,NULL),(79,'notes_payable',NULL,NULL,NULL,'detail_type',9,'notes_payable_desc',1,NULL,NULL),(80,'other_non-current_liabilities',NULL,NULL,NULL,'detail_type',9,'other_non-current_liabilities_desc',1,NULL,NULL),(81,'shareholder_notes_payable',NULL,NULL,NULL,'detail_type',9,'shareholder_notes_payable_desc',1,NULL,NULL),(82,'accumulated_adjustment',NULL,NULL,NULL,'detail_type',10,'accumulated_adjustment_desc',1,NULL,NULL),(83,'dividend_disbursed',NULL,NULL,NULL,'detail_type',10,'dividend_disbursed_desc',1,NULL,NULL),(84,'equity_in_earnings_of_subsidiaries',NULL,NULL,NULL,'detail_type',10,'equity_in_earnings_of_subsidiaries_desc',1,NULL,NULL),(85,'opening_balance_equity',NULL,NULL,NULL,'detail_type',10,'opening_balance_equity_desc',1,NULL,NULL),(86,'ordinary_shares',NULL,NULL,NULL,'detail_type',10,'ordinary_shares_desc',1,NULL,NULL),(87,'other_comprehensive_income',NULL,NULL,NULL,'detail_type',10,'other_comprehensive_income_desc',1,NULL,NULL),(88,'owner\'s_equity',NULL,NULL,NULL,'detail_type',10,'owner\'s_equity_desc',1,NULL,NULL),(89,'paid-in_capital_or_surplus',NULL,NULL,NULL,'detail_type',10,'paid-in_capital_or_surplus_desc',1,NULL,NULL),(90,'partner_contributions',NULL,NULL,NULL,'detail_type',10,'partner_contributions_desc',1,NULL,NULL),(91,'partner_distributions',NULL,NULL,NULL,'detail_type',10,'partner_distributions_desc',1,NULL,NULL),(92,'partner\'s_equity',NULL,NULL,NULL,'detail_type',10,'partner\'s_equity_desc',1,NULL,NULL),(93,'preferred_shares',NULL,NULL,NULL,'detail_type',10,'preferred_shares_desc',1,NULL,NULL),(94,'retained_earnings',NULL,NULL,NULL,'detail_type',10,'retained_earnings_desc',1,NULL,NULL),(95,'share_capital',NULL,NULL,NULL,'detail_type',10,'share_capital_desc',1,NULL,NULL),(96,'treasury_shares',NULL,NULL,NULL,'detail_type',10,'treasury_shares_desc',1,NULL,NULL),(97,'discounts/refunds_given',NULL,NULL,NULL,'detail_type',11,'discounts/refunds_given_desc',1,NULL,NULL),(98,'non-profit_income',NULL,NULL,NULL,'detail_type',11,'non-profit_income_desc',1,NULL,NULL),(99,'other_primary_income',NULL,NULL,NULL,'detail_type',11,'other_primary_income_desc',1,NULL,NULL),(100,'revenue_-_general',NULL,NULL,NULL,'detail_type',11,'revenue_-_general_desc',1,NULL,NULL),(101,'sales_-_retail',NULL,NULL,NULL,'detail_type',11,'sales_-_retail_desc',1,NULL,NULL),(102,'sales_-_wholesale',NULL,NULL,NULL,'detail_type',11,'sales_-_wholesale_desc',1,NULL,NULL),(103,'sales_of_product_income',NULL,NULL,NULL,'detail_type',11,'sales_of_product_income_desc',1,NULL,NULL),(104,'service/fee_income',NULL,NULL,NULL,'detail_type',11,'service/fee_income_desc',1,NULL,NULL),(105,'unapplied_cash_payment_income',NULL,NULL,NULL,'detail_type',11,'unapplied_cash_payment_income_desc',1,NULL,NULL),(106,'dividend_income',NULL,NULL,NULL,'detail_type',12,'dividend_income_desc',1,NULL,NULL),(107,'interest_earned',NULL,NULL,NULL,'detail_type',12,'interest_earned_desc',1,NULL,NULL),(108,'loss_on_disposal_of_assets',NULL,NULL,NULL,'detail_type',12,'loss_on_disposal_of_assets_desc',1,NULL,NULL),(109,'other_investment_income',NULL,NULL,NULL,'detail_type',12,'other_investment_income_desc',1,NULL,NULL),(110,'other_miscellaneous_income',NULL,NULL,NULL,'detail_type',12,'other_miscellaneous_income_desc',1,NULL,NULL),(111,'other_operating_income',NULL,NULL,NULL,'detail_type',12,'other_operating_income_desc',1,NULL,NULL),(112,'tax-exempt_interest',NULL,NULL,NULL,'detail_type',12,'tax-exempt_interest_desc',1,NULL,NULL),(113,'unrealised_loss_on_securities,_net_of_tax',NULL,NULL,NULL,'detail_type',12,'unrealised_loss_on_securities,_net_of_tax_desc',1,NULL,NULL),(114,'cost_of_labour_-_cos',NULL,NULL,NULL,'detail_type',13,'cost_of_labour_-_cos_desc',1,NULL,NULL),(115,'equipment_rental_-_cos',NULL,NULL,NULL,'detail_type',13,'equipment_rental_-_cos_desc',1,NULL,NULL),(116,'freight_and_delivery_-_cos',NULL,NULL,NULL,'detail_type',13,'freight_and_delivery_-_cos_desc',1,NULL,NULL),(117,'other_costs_of_sales_-_cos',NULL,NULL,NULL,'detail_type',13,'other_costs_of_sales_-_cos_desc',1,NULL,NULL),(118,'supplies_and_materials_-_cos',NULL,NULL,NULL,'detail_type',13,'supplies_and_materials_-_cos_desc',1,NULL,NULL),(119,'advertising/promotional',NULL,NULL,NULL,'detail_type',14,'advertising/promotional_desc',1,NULL,NULL),(120,'amortisation_expense',NULL,NULL,NULL,'detail_type',14,'amortisation_expense_desc',1,NULL,NULL),(121,'auto',NULL,NULL,NULL,'detail_type',14,'auto_desc',1,NULL,NULL),(122,'bad_debts',NULL,NULL,NULL,'detail_type',14,'bad_debts_desc',1,NULL,NULL),(123,'bank_charges',NULL,NULL,NULL,'detail_type',14,'bank_charges_desc',1,NULL,NULL),(124,'charitable_contributions',NULL,NULL,NULL,'detail_type',14,'charitable_contributions_desc',1,NULL,NULL),(125,'commissions_and_fees',NULL,NULL,NULL,'detail_type',14,'commissions_and_fees_desc',1,NULL,NULL),(126,'cost_of_labour',NULL,NULL,NULL,'detail_type',14,'cost_of_labour_desc',1,NULL,NULL),(127,'dues_and_subscriptions',NULL,NULL,NULL,'detail_type',14,'dues_and_subscriptions_desc',1,NULL,NULL),(128,'equipment_rental',NULL,NULL,NULL,'detail_type',14,'equipment_rental_desc',1,NULL,NULL),(129,'finance_costs',NULL,NULL,NULL,'detail_type',14,'finance_costs_desc',1,NULL,NULL),(130,'income_tax_expense',NULL,NULL,NULL,'detail_type',14,'income_tax_expense_desc',1,NULL,NULL),(131,'insurance',NULL,NULL,NULL,'detail_type',14,'insurance_desc',1,NULL,NULL),(132,'interest_paid',NULL,NULL,NULL,'detail_type',14,'interest_paid_desc',1,NULL,NULL),(133,'legal_and_professional_fees',NULL,NULL,NULL,'detail_type',14,'legal_and_professional_fees_desc',1,NULL,NULL),(134,'loss_on_discontinued_operations,_net_of_tax',NULL,NULL,NULL,'detail_type',14,'loss_on_discontinued_operations,_net_of_tax_desc',1,NULL,NULL),(135,'management_compensation',NULL,NULL,NULL,'detail_type',14,'management_compensation_desc',1,NULL,NULL),(136,'meals_and_entertainment',NULL,NULL,NULL,'detail_type',14,'meals_and_entertainment_desc',1,NULL,NULL),(137,'office/general_administrative_expenses',NULL,NULL,NULL,'detail_type',14,'office/general_administrative_expenses_desc',1,NULL,NULL),(138,'other_miscellaneous_service_cost',NULL,NULL,NULL,'detail_type',14,'other_miscellaneous_service_cost_desc',1,NULL,NULL),(139,'other_selling_expenses',NULL,NULL,NULL,'detail_type',14,'other_selling_expenses_desc',1,NULL,NULL),(140,'payroll_expenses',NULL,NULL,NULL,'detail_type',14,'payroll_expenses_desc',1,NULL,NULL),(141,'rent_or_lease_of_buildings',NULL,NULL,NULL,'detail_type',14,'rent_or_lease_of_buildings_desc',1,NULL,NULL),(142,'repair_and_maintenance',NULL,NULL,NULL,'detail_type',14,'repair_and_maintenance_desc',1,NULL,NULL),(143,'shipping_and_delivery_expense',NULL,NULL,NULL,'detail_type',14,'shipping_and_delivery_expense_desc',1,NULL,NULL),(144,'supplies_and_materials',NULL,NULL,NULL,'detail_type',14,'supplies_and_materials_desc',1,NULL,NULL),(145,'taxes_paid',NULL,NULL,NULL,'detail_type',14,'taxes_paid_desc',1,NULL,NULL),(146,'travel_expenses_-_general_and_admin_expenses',NULL,NULL,NULL,'detail_type',14,'travel_expenses_-_general_and_admin_expenses_desc',1,NULL,NULL),(147,'travel_expenses_-_selling_expense',NULL,NULL,NULL,'detail_type',14,'travel_expenses_-_selling_expense_desc',1,NULL,NULL),(148,'unapplied_cash_bill_payment_expense',NULL,NULL,NULL,'detail_type',14,'unapplied_cash_bill_payment_expense_desc',1,NULL,NULL),(149,'utilities',NULL,NULL,NULL,'detail_type',14,'utilities_desc',1,NULL,NULL),(150,'amortisation',NULL,NULL,NULL,'detail_type',15,'amortisation_desc',1,NULL,NULL),(151,'depreciation',NULL,NULL,NULL,'detail_type',15,'depreciation_desc',1,NULL,NULL),(152,'exchange_gain_or_loss',NULL,NULL,NULL,'detail_type',15,'exchange_gain_or_loss_desc',1,NULL,NULL),(153,'other_expense',NULL,NULL,NULL,'detail_type',15,'other_expense_desc',1,NULL,NULL),(154,'penalties_and_settlements',NULL,NULL,NULL,'detail_type',15,'penalties_and_settlements_desc',1,NULL,NULL);
/*!40000 ALTER TABLE `accounting_account_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounting_accounts`
--

DROP TABLE IF EXISTS `accounting_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `gl_code` varchar(191) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `account_primary_type` varchar(191) DEFAULT NULL,
  `account_sub_type_id` bigint(20) DEFAULT NULL,
  `detail_type_id` bigint(20) DEFAULT NULL,
  `parent_account_id` bigint(20) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting_accounts`
--

LOCK TABLES `accounting_accounts` WRITE;
/*!40000 ALTER TABLE `accounting_accounts` DISABLE KEYS */;
INSERT INTO `accounting_accounts` VALUES (1,'Accounts Payable (A/P)',NULL,1,'liability',6,58,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(2,'Credit Card',NULL,1,'liability',7,59,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(3,'Wage expenses',NULL,1,'expenses',14,140,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(4,'Utilities',NULL,1,'expenses',14,149,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(5,'Unrealised loss on securities, net of tax',NULL,1,'income',12,113,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(6,'Undeposited Funds',NULL,1,'asset',2,29,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(7,'Uncategorised Income',NULL,1,'income',11,103,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(8,'Uncategorised Expense',NULL,1,'expenses',14,138,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(9,'Uncategorised Asset',NULL,1,'asset',2,26,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(10,'Unapplied Cash Payment Income',NULL,1,'income',11,105,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(11,'Travel expenses - selling expense',NULL,1,'expenses',14,147,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(12,'Travel expenses - general and admin expenses',NULL,1,'expenses',14,146,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(13,'Supplies',NULL,1,'expenses',14,145,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(14,'Subcontractors - COS',NULL,1,'expenses',13,114,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(15,'Stationery and printing',NULL,1,'expenses',14,137,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(16,'Short-term debit',NULL,1,'liability',8,69,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(17,'Shipping and delivery expense',NULL,1,'expenses',14,143,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(18,'Share capital',NULL,1,'equity',10,95,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(19,'Sales of Product Income',NULL,1,'income',11,103,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(20,'Sales - wholesale',NULL,1,'income',11,102,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(21,'Sales - retail',NULL,1,'income',11,101,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(22,'Sales',NULL,1,'income',11,103,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(23,'Revenue - General',NULL,1,'income',11,100,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(24,'Retained Earnings',NULL,1,'equity',10,94,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(25,'Repair and maintenance',NULL,1,'expenses',14,142,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(26,'Rent or lease payments',NULL,1,'expenses',14,141,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(27,'Reconciliation Discrepancies',NULL,1,'expenses',15,153,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(28,'Purchases',NULL,1,'expenses',14,144,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(29,'Property, plant and equipment',NULL,1,'asset',4,42,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(30,'Prepaid Expenses',NULL,1,'asset',2,27,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(31,'Payroll liabilities',NULL,1,'liability',8,71,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(32,'Payroll Expenses',NULL,1,'expenses',14,140,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(33,'Payroll Clearing',NULL,1,'liability',8,70,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(34,'Overhead - COS',NULL,1,'expenses',13,114,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(35,'Other Types of Expenses-Advertising Expenses',NULL,1,'expenses',14,119,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(36,'Other selling expenses',NULL,1,'expenses',14,139,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(37,'Other operating income (expenses)',NULL,1,'income',12,111,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(38,'Other general and administrative expenses',NULL,1,'expenses',14,137,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(39,'Other comprehensive income',NULL,1,'equity',10,87,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(40,'Other - COS',NULL,1,'expenses',13,114,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(41,'Office expenses',NULL,1,'expenses',14,137,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(42,'Meals and entertainment',NULL,1,'expenses',14,137,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(43,'Materials - COS',NULL,1,'expenses',13,114,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(44,'Management compensation',NULL,1,'expenses',14,135,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(45,'Loss on disposal of assets',NULL,1,'income',12,108,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(46,'Loss on discontinued operations, net of tax',NULL,1,'expenses',14,134,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(47,'Long-term investments',NULL,1,'asset',5,54,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(48,'Long-term debt',NULL,1,'liability',9,78,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(49,'Liabilities related to assets held for sale',NULL,1,'liability',9,77,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(50,'Legal and professional fees',NULL,1,'expenses',14,133,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(51,'Inventory Asset',NULL,1,'asset',2,21,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(52,'Inventory',NULL,1,'asset',2,21,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(53,'Interest income',NULL,1,'income',12,107,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(54,'Interest expense',NULL,1,'expenses',14,132,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(55,'Intangibles',NULL,1,'asset',5,51,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(56,'Insurance - Liability',NULL,1,'expenses',14,131,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(57,'Insurance - General',NULL,1,'expenses',14,131,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(58,'Insurance - Disability',NULL,1,'expenses',14,131,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(59,'Income tax payable',NULL,1,'liability',8,65,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(60,'Income tax expense',NULL,1,'expenses',14,130,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(61,'Goodwill',NULL,1,'asset',5,50,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(62,'Freight and delivery - COS',NULL,1,'expenses',13,114,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(63,'Equity in earnings of subsidiaries',NULL,1,'equity',10,84,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(64,'Equipment rental',NULL,1,'expenses',14,128,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(65,'Dues and Subscriptions',NULL,1,'expenses',14,127,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(66,'Dividends payable',NULL,1,'liability',8,64,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(67,'Dividend income',NULL,1,'income',12,106,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(68,'Dividend disbursed',NULL,1,'equity',10,83,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(69,'Discounts given - COS',NULL,1,'expenses',13,114,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(70,'Direct labour - COS',NULL,1,'expenses',13,114,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(71,'Deferred tax assets',NULL,1,'asset',5,49,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(72,'Cost of sales',NULL,1,'expenses',13,118,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(73,'Commissions and fees',NULL,1,'expenses',14,125,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(74,'Change in inventory - COS',NULL,1,'expenses',13,114,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(75,'Cash and cash equivalents',NULL,1,'asset',3,31,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(76,'Billable Expense Income',NULL,1,'income',11,103,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(77,'Bank charges',NULL,1,'expenses',14,123,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(78,'Bad debts',NULL,1,'expenses',14,122,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(79,'Available for sale assets (short-term)',NULL,1,'asset',2,18,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(80,'Assets held for sale',NULL,1,'asset',5,48,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(81,'Amortisation expense',NULL,1,'expenses',14,120,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(82,'Allowance for bad debts',NULL,1,'asset',2,17,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(83,'Accumulated depreciation on property, plant and equipment',NULL,1,'asset',4,38,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(84,'Accrued non-current liabilities',NULL,1,'liability',9,76,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(85,'Accrued liabilities',NULL,1,'liability',8,60,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(86,'Accrued holiday payable',NULL,1,'liability',9,75,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12'),(87,'Accounts Receivable (A/R)',NULL,1,'asset',1,16,NULL,NULL,'active',1,'2023-08-28 18:23:12','2023-08-28 18:23:12');
/*!40000 ALTER TABLE `accounting_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounting_accounts_transactions`
--

DROP TABLE IF EXISTS `accounting_accounts_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_accounts_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `accounting_account_id` bigint(20) unsigned NOT NULL,
  `acc_trans_mapping_id` int(11) DEFAULT NULL COMMENT 'id form accounting_acc_trans_mapping table',
  `transaction_id` int(11) DEFAULT NULL COMMENT 'id form transactions table',
  `transaction_payment_id` int(11) DEFAULT NULL COMMENT 'id form transaction_payments table',
  `amount` decimal(22,4) NOT NULL,
  `type` varchar(100) NOT NULL COMMENT 'debit, credit etc',
  `sub_type` varchar(100) NOT NULL,
  `map_type` varchar(100) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `operation_date` datetime NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting_accounts_transactions`
--

LOCK TABLES `accounting_accounts_transactions` WRITE;
/*!40000 ALTER TABLE `accounting_accounts_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounting_accounts_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounting_budgets`
--

DROP TABLE IF EXISTS `accounting_budgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_budgets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `accounting_account_id` bigint(20) unsigned NOT NULL,
  `financial_year` int(11) NOT NULL,
  `jan` decimal(22,4) DEFAULT NULL,
  `feb` decimal(22,4) DEFAULT NULL,
  `mar` decimal(22,4) DEFAULT NULL,
  `apr` decimal(22,4) DEFAULT NULL,
  `may` decimal(22,4) DEFAULT NULL,
  `jun` decimal(22,4) DEFAULT NULL,
  `jul` decimal(22,4) DEFAULT NULL,
  `aug` decimal(22,4) DEFAULT NULL,
  `sep` decimal(22,4) DEFAULT NULL,
  `oct` decimal(22,4) DEFAULT NULL,
  `nov` decimal(22,4) DEFAULT NULL,
  `dec` decimal(22,4) DEFAULT NULL,
  `quarter_1` decimal(22,4) DEFAULT NULL,
  `quarter_2` decimal(22,4) DEFAULT NULL,
  `quarter_3` decimal(22,4) DEFAULT NULL,
  `quarter_4` decimal(22,4) DEFAULT NULL,
  `yearly` decimal(22,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting_budgets`
--

LOCK TABLES `accounting_budgets` WRITE;
/*!40000 ALTER TABLE `accounting_budgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounting_budgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `account_number` varchar(191) NOT NULL,
  `account_details` text DEFAULT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_business_id_index` (`business_id`),
  KEY `accounts_account_type_id_index` (`account_type_id`),
  KEY `accounts_created_by_index` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(191) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) DEFAULT NULL,
  `event` varchar(191) DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) DEFAULT NULL,
  `properties` text DEFAULT NULL,
  `batch_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
INSERT INTO `activity_log` VALUES (1,'default','added',1,'App\\Transaction',NULL,1,1,'App\\User','{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":100}}',NULL,'2023-08-28 18:21:42','2023-08-28 18:21:42'),(2,'default','login',1,'App\\User',NULL,1,1,'App\\User','[]',NULL,'2023-08-29 05:32:48','2023-08-29 05:32:48'),(3,'default','login',1,'App\\User',NULL,1,1,'App\\User','[]',NULL,'2023-08-29 17:19:23','2023-08-29 17:19:23'),(4,'default','login',1,'App\\User',NULL,1,1,'App\\User','[]',NULL,'2023-08-30 10:47:36','2023-08-30 10:47:36');
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aiassistance_history`
--

DROP TABLE IF EXISTS `aiassistance_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aiassistance_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tool_type` varchar(191) NOT NULL,
  `input_data` text DEFAULT NULL,
  `tokens_used` int(11) NOT NULL DEFAULT 0,
  `output_data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aiassistance_history`
--

LOCK TABLES `aiassistance_history` WRITE;
/*!40000 ALTER TABLE `aiassistance_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `aiassistance_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_maintenances`
--

DROP TABLE IF EXISTS `asset_maintenances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_maintenances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  `maitenance_id` varchar(191) DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `priority` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `maintenance_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_maintenances_business_id_index` (`business_id`),
  KEY `asset_maintenances_asset_id_index` (`asset_id`),
  KEY `asset_maintenances_status_index` (`status`),
  KEY `asset_maintenances_priority_index` (`priority`),
  KEY `asset_maintenances_created_by_index` (`created_by`),
  KEY `asset_maintenances_assigned_to_index` (`assigned_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_maintenances`
--

LOCK TABLES `asset_maintenances` WRITE;
/*!40000 ALTER TABLE `asset_maintenances` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_maintenances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_transactions`
--

DROP TABLE IF EXISTS `asset_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `asset_id` int(10) unsigned DEFAULT NULL,
  `transaction_type` varchar(191) NOT NULL,
  `ref_no` varchar(191) NOT NULL,
  `receiver` int(10) unsigned DEFAULT NULL COMMENT 'id from users table, who receives asset',
  `quantity` decimal(22,4) NOT NULL,
  `transaction_datetime` datetime NOT NULL,
  `allocated_upto` date DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'id from asset_transactions table',
  `created_by` int(10) unsigned NOT NULL COMMENT 'id from users table, who allocated asset',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asset_transactions_business_id_foreign` (`business_id`),
  KEY `asset_transactions_asset_id_foreign` (`asset_id`),
  KEY `asset_transactions_receiver_foreign` (`receiver`),
  KEY `asset_transactions_parent_id_foreign` (`parent_id`),
  KEY `asset_transactions_created_by_foreign` (`created_by`),
  CONSTRAINT `asset_transactions_asset_id_foreign` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `asset_transactions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `asset_transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `asset_transactions_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `asset_transactions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `asset_transactions_receiver_foreign` FOREIGN KEY (`receiver`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_transactions`
--

LOCK TABLES `asset_transactions` WRITE;
/*!40000 ALTER TABLE `asset_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_warranties`
--

DROP TABLE IF EXISTS `asset_warranties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_warranties` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `additional_cost` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_warranties`
--

LOCK TABLES `asset_warranties` WRITE;
/*!40000 ALTER TABLE `asset_warranties` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_warranties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `asset_code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `model` varchar(191) DEFAULT NULL,
  `serial_no` varchar(191) DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `location_id` int(10) unsigned DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_type` varchar(191) DEFAULT NULL,
  `unit_price` decimal(22,4) NOT NULL,
  `depreciation` decimal(22,4) DEFAULT NULL,
  `is_allocatable` tinyint(1) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_business_id_foreign` (`business_id`),
  KEY `assets_category_id_foreign` (`category_id`),
  KEY `assets_created_by_foreign` (`created_by`),
  CONSTRAINT `assets_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `assets_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barcodes`
--

DROP TABLE IF EXISTS `barcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barcodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_continuous` tinyint(1) NOT NULL DEFAULT 0,
  `stickers_in_one_sheet` int(11) DEFAULT NULL,
  `business_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `barcodes_business_id_foreign` (`business_id`),
  CONSTRAINT `barcodes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barcodes`
--

LOCK TABLES `barcodes` WRITE;
/*!40000 ALTER TABLE `barcodes` DISABLE KEYS */;
INSERT INTO `barcodes` VALUES (1,'20 Labels per Sheet','Sheet Size: 8.5\" x 11\", Label Size: 4\" x 1\", Labels per sheet: 20',4.0000,1.0000,8.5000,11.0000,0.5000,0.1250,0.0000,0.1875,2,0,0,20,NULL,'2017-12-18 00:13:44','2017-12-18 00:13:44'),(2,'30 Labels per sheet','Sheet Size: 8.5\" x 11\", Label Size: 2.625\" x 1\", Labels per sheet: 30',2.6250,1.0000,8.5000,11.0000,0.5000,0.1880,0.0000,0.1250,3,0,0,30,NULL,'2017-12-18 00:04:39','2017-12-18 00:10:40'),(3,'32 Labels per sheet','Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1.25\", Labels per sheet: 32',2.0000,1.2500,8.5000,11.0000,0.5000,0.2500,0.0000,0.0000,4,0,0,32,NULL,'2017-12-17 23:55:40','2017-12-17 23:55:40'),(4,'40 Labels per sheet','Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1\", Labels per sheet: 40',2.0000,1.0000,8.5000,11.0000,0.5000,0.2500,0.0000,0.0000,4,0,0,40,NULL,'2017-12-17 23:58:40','2017-12-17 23:58:40'),(5,'50 Labels per Sheet','Sheet Size: 8.5\" x 11\", Label Size: 1.5\" x 1\", Labels per sheet: 50',1.5000,1.0000,8.5000,11.0000,0.5000,0.5000,0.0000,0.0000,5,0,0,50,NULL,'2017-12-17 23:51:10','2017-12-17 23:51:10'),(6,'Continuous Rolls - 31.75mm x 25.4mm','Label Size: 31.75mm x 25.4mm, Gap: 3.18mm',1.2500,1.0000,1.2500,0.0000,0.1250,0.0000,0.1250,0.0000,1,0,1,NULL,NULL,'2017-12-17 23:51:10','2017-12-17 23:51:10');
/*!40000 ALTER TABLE `barcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int(10) unsigned NOT NULL,
  `waiter_id` int(10) unsigned DEFAULT NULL,
  `table_id` int(10) unsigned DEFAULT NULL,
  `correspondent_id` int(11) DEFAULT NULL,
  `business_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `booking_status` varchar(191) NOT NULL,
  `booking_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_contact_id_foreign` (`contact_id`),
  KEY `bookings_business_id_foreign` (`business_id`),
  KEY `bookings_created_by_foreign` (`created_by`),
  KEY `bookings_table_id_index` (`table_id`),
  KEY `bookings_waiter_id_index` (`waiter_id`),
  KEY `bookings_location_id_index` (`location_id`),
  KEY `bookings_booking_status_index` (`booking_status`),
  KEY `bookings_correspondent_id_index` (`correspondent_id`),
  CONSTRAINT `bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `use_for_repair` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'brands to be used on repair module',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brands_business_id_foreign` (`business_id`),
  KEY `brands_created_by_foreign` (`created_by`),
  CONSTRAINT `brands_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) DEFAULT NULL,
  `tax_label_1` varchar(10) DEFAULT NULL,
  `tax_number_2` varchar(100) DEFAULT NULL,
  `tax_label_2` varchar(10) DEFAULT NULL,
  `code_label_1` varchar(191) DEFAULT NULL,
  `code_1` varchar(191) DEFAULT NULL,
  `code_label_2` varchar(191) DEFAULT NULL,
  `code_2` varchar(191) DEFAULT NULL,
  `default_sales_tax` int(10) unsigned DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT 0.00,
  `owner_id` int(10) unsigned NOT NULL,
  `time_zone` varchar(191) NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint(4) NOT NULL DEFAULT 1,
  `accounting_method` enum('fifo','lifo','avco') NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(5,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') NOT NULL DEFAULT 'includes',
  `logo` varchar(191) DEFAULT NULL,
  `sku_prefix` varchar(191) DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `expiry_type` enum('add_expiry','add_manufacturing') NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int(11) NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT 1,
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int(10) unsigned DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT 1.000,
  `transaction_edit_days` int(10) unsigned NOT NULL DEFAULT 30,
  `stock_expiry_alert_days` int(10) unsigned NOT NULL DEFAULT 30,
  `keyboard_shortcuts` text DEFAULT NULL,
  `pos_settings` text DEFAULT NULL,
  `manufacturing_settings` text DEFAULT NULL,
  `weighing_scale_setting` text NOT NULL COMMENT 'used to store the configuration of weighing scale',
  `essentials_settings` longtext DEFAULT NULL,
  `enable_brand` tinyint(1) NOT NULL DEFAULT 1,
  `enable_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT 1,
  `enable_purchase_status` tinyint(1) DEFAULT 1,
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT 0,
  `default_unit` int(11) DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT 0,
  `enable_racks` tinyint(1) NOT NULL DEFAULT 0,
  `enable_row` tinyint(1) NOT NULL DEFAULT 0,
  `enable_position` tinyint(1) NOT NULL DEFAULT 0,
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT 1,
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT 1,
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT 1,
  `currency_symbol_placement` enum('before','after') NOT NULL DEFAULT 'before',
  `enabled_modules` text DEFAULT NULL,
  `date_format` varchar(191) NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') NOT NULL DEFAULT '24',
  `currency_precision` tinyint(4) NOT NULL DEFAULT 2,
  `quantity_precision` tinyint(4) NOT NULL DEFAULT 2,
  `ref_no_prefixes` text DEFAULT NULL,
  `theme_color` char(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `accounting_settings` text DEFAULT NULL,
  `asset_settings` text DEFAULT NULL,
  `enable_rp` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `rp_name` varchar(191) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_order_total_for_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `max_rp_per_order` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_order_total_for_redeem` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') NOT NULL DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `repair_settings` text DEFAULT NULL,
  `repair_jobsheet_settings` text DEFAULT NULL,
  `email_settings` text DEFAULT NULL,
  `sms_settings` text DEFAULT NULL,
  `custom_labels` text DEFAULT NULL,
  `common_settings` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_owner_id_foreign` (`owner_id`),
  KEY `business_currency_id_foreign` (`currency_id`),
  KEY `business_default_sales_tax_foreign` (`default_sales_tax`),
  CONSTRAINT `business_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `business_default_sales_tax_foreign` FOREIGN KEY (`default_sales_tax`) REFERENCES `tax_rates` (`id`),
  CONSTRAINT `business_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business`
--

LOCK TABLES `business` WRITE;
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
INSERT INTO `business` VALUES (1,'Zillur LTD',134,'2023-08-20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25.00,1,'Asia/Kolkata',1,'fifo',NULL,'includes',NULL,NULL,0,'add_expiry','keep_selling',0,1,0,NULL,1.000,30,30,'{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"recent_product_quantity\":\"f2\",\"add_new_product\":\"f4\"}}',NULL,NULL,'',NULL,1,1,1,1,1,0,NULL,0,0,0,0,1,NULL,1,0,'before','[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\"]','m/d/Y','24',2,2,'{\"purchase\":\"PO\",\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"business_location\":\"BL\"}',NULL,NULL,NULL,NULL,0,NULL,1.0000,1.0000,NULL,1.0000,1.0000,NULL,NULL,NULL,'year',NULL,NULL,NULL,NULL,NULL,NULL,1,'2023-08-28 17:44:13','2023-08-28 17:44:13');
/*!40000 ALTER TABLE `business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_locations`
--

DROP TABLE IF EXISTS `business_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `location_id` varchar(191) DEFAULT NULL,
  `name` varchar(256) NOT NULL,
  `landmark` text DEFAULT NULL,
  `country` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip_code` char(7) NOT NULL,
  `invoice_scheme_id` int(10) unsigned NOT NULL,
  `invoice_layout_id` int(10) unsigned NOT NULL,
  `sale_invoice_layout_id` int(11) DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT 1,
  `receipt_printer_type` enum('browser','printer') NOT NULL DEFAULT 'browser',
  `printer_id` int(11) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `alternate_number` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `website` varchar(191) DEFAULT NULL,
  `featured_products` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `default_payment_accounts` text DEFAULT NULL,
  `custom_field1` varchar(191) DEFAULT NULL,
  `custom_field2` varchar(191) DEFAULT NULL,
  `custom_field3` varchar(191) DEFAULT NULL,
  `custom_field4` varchar(191) DEFAULT NULL,
  `accounting_default_map` text DEFAULT NULL COMMENT 'Default transactions mapping of accounting module',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_locations_business_id_index` (`business_id`),
  KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`),
  KEY `business_locations_sale_invoice_layout_id_index` (`sale_invoice_layout_id`),
  KEY `business_locations_selling_price_group_id_index` (`selling_price_group_id`),
  KEY `business_locations_receipt_printer_type_index` (`receipt_printer_type`),
  KEY `business_locations_printer_id_index` (`printer_id`),
  CONSTRAINT `business_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `business_locations_invoice_layout_id_foreign` FOREIGN KEY (`invoice_layout_id`) REFERENCES `invoice_layouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `business_locations_invoice_scheme_id_foreign` FOREIGN KEY (`invoice_scheme_id`) REFERENCES `invoice_schemes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_locations`
--

LOCK TABLES `business_locations` WRITE;
/*!40000 ALTER TABLE `business_locations` DISABLE KEYS */;
INSERT INTO `business_locations` VALUES (1,1,'BL0001','Zillur LTD','dhaka','BD','Dhaka','Dhaka','1200',1,1,1,NULL,1,'browser',NULL,'','','','',NULL,1,'{\"cash\":{\"is_enabled\":1,\"account\":null},\"card\":{\"is_enabled\":1,\"account\":null},\"cheque\":{\"is_enabled\":1,\"account\":null},\"bank_transfer\":{\"is_enabled\":1,\"account\":null},\"other\":{\"is_enabled\":1,\"account\":null},\"custom_pay_1\":{\"is_enabled\":1,\"account\":null},\"custom_pay_2\":{\"is_enabled\":1,\"account\":null},\"custom_pay_3\":{\"is_enabled\":1,\"account\":null},\"custom_pay_4\":{\"is_enabled\":1,\"account\":null},\"custom_pay_5\":{\"is_enabled\":1,\"account\":null},\"custom_pay_6\":{\"is_enabled\":1,\"account\":null},\"custom_pay_7\":{\"is_enabled\":1,\"account\":null}}',NULL,NULL,NULL,NULL,NULL,NULL,'2023-08-28 17:44:13','2023-08-28 17:44:13');
/*!40000 ALTER TABLE `business_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_denominations`
--

DROP TABLE IF EXISTS `cash_denominations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_denominations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `amount` decimal(22,4) NOT NULL,
  `total_count` int(11) NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_denominations_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_denominations`
--

LOCK TABLES `cash_denominations` WRITE;
/*!40000 ALTER TABLE `cash_denominations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash_denominations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_register_transactions`
--

DROP TABLE IF EXISTS `cash_register_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_register_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cash_register_id` int(10) unsigned NOT NULL,
  `amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `pay_method` varchar(191) DEFAULT NULL,
  `type` enum('debit','credit') NOT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`),
  KEY `cash_register_transactions_transaction_id_index` (`transaction_id`),
  KEY `cash_register_transactions_type_index` (`type`),
  KEY `cash_register_transactions_transaction_type_index` (`transaction_type`),
  CONSTRAINT `cash_register_transactions_cash_register_id_foreign` FOREIGN KEY (`cash_register_id`) REFERENCES `cash_registers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_register_transactions`
--

LOCK TABLES `cash_register_transactions` WRITE;
/*!40000 ALTER TABLE `cash_register_transactions` DISABLE KEYS */;
INSERT INTO `cash_register_transactions` VALUES (1,1,100.0000,'cash','credit','sell',1,'2023-08-28 18:21:42','2023-08-28 18:21:42');
/*!40000 ALTER TABLE `cash_register_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_registers`
--

DROP TABLE IF EXISTS `cash_registers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_registers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `status` enum('close','open') NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `total_card_slips` int(11) NOT NULL DEFAULT 0,
  `total_cheques` int(11) NOT NULL DEFAULT 0,
  `denominations` text DEFAULT NULL,
  `closing_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_registers_business_id_foreign` (`business_id`),
  KEY `cash_registers_user_id_foreign` (`user_id`),
  KEY `cash_registers_location_id_index` (`location_id`),
  CONSTRAINT `cash_registers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_registers`
--

LOCK TABLES `cash_registers` WRITE;
/*!40000 ALTER TABLE `cash_registers` DISABLE KEYS */;
INSERT INTO `cash_registers` VALUES (1,1,1,1,'open',NULL,0.0000,0,0,NULL,NULL,'2023-08-28 18:21:00','2023-08-28 18:21:32');
/*!40000 ALTER TABLE `cash_registers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) unsigned NOT NULL,
  `short_code` varchar(191) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `category_type` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_business_id_foreign` (`business_id`),
  KEY `categories_created_by_foreign` (`created_by`),
  KEY `categories_parent_id_index` (`parent_id`),
  CONSTRAINT `categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'industry',1,NULL,0,1,'project','industry',NULL,NULL,'2023-08-28 18:24:34','2023-08-28 18:24:34');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorizables`
--

DROP TABLE IF EXISTS `categorizables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorizables` (
  `category_id` int(11) NOT NULL,
  `categorizable_type` varchar(191) NOT NULL,
  `categorizable_id` bigint(20) unsigned NOT NULL,
  KEY `categorizables_categorizable_type_categorizable_id_index` (`categorizable_type`,`categorizable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorizables`
--

LOCK TABLES `categorizables` WRITE;
/*!40000 ALTER TABLE `categorizables` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorizables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_metas`
--

DROP TABLE IF EXISTS `cms_page_metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page_metas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cms_page_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(191) NOT NULL,
  `meta_value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_page_metas_cms_page_id_foreign` (`cms_page_id`),
  CONSTRAINT `cms_page_metas_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_metas`
--

LOCK TABLES `cms_page_metas` WRITE;
/*!40000 ALTER TABLE `cms_page_metas` DISABLE KEYS */;
INSERT INTO `cms_page_metas` VALUES (1,3,'industry','{\"id\":\"1\",\"title\":\"We\'re Ready For Your Business!\",\"description\":\"<p>If you\'re in need of business management software, you\'ve come to the right place.&nbsp;<\\/p>\\r\\n<p>We have a clean, modern modular design that is sure to fit your business!<\\/p>\",\"content\":[{\"icon\":\"fas fa-store-alt\",\"title\":\"Departmental Store\",\"description\":\"Looking for a software solution that can help you manage and sell all of your essential items in one place? Look no further than our one-stop departmental store software. Whether you need to sell clothes, shoes, bags, or any other type of item, our software has you covered. Plus, our easy-to-use interface makes it simple to get started selling right away. So why wait? Get started today!\"},{\"icon\":\"fas fa-store\",\"title\":\"Retail & Wholesale\",\"description\":\"A complete suite of features to manage both retail & wholesales stores. Set multiple prices for different customer segments or different business locations.\"},{\"icon\":\"fas fa-notes-medical\",\"title\":\"Pharmacy\",\"description\":\"Our software is perfect for any pharmaceutical company. You can set product expiration dates and lot numbers, and sell in different units of measure. Stop selling expired & to-be-expired items to customers. Check details reports on stock expiry by lot numbers\"},{\"icon\":\"fas fa-prescription-bottle\",\"title\":\"Liquor\",\"description\":\"Easy to use for every liquor shop. Sell in ml of simple sell the bottle, you can easily manage them.\"},{\"icon\":\"fas fa-mobile-alt\",\"title\":\"Mobile & Electronics\",\"description\":\"Record inventory serial number, sell items with particular serial number,\"},{\"icon\":\"fas fa-wrench\",\"title\":\"Repair Shop\",\"description\":\"A complete suite of features to manage repair business, create job sheet, assign job sheet to technician, repair status, convert job sheet to invoices. Self link for customers to check repair progress\"},{\"icon\":\"fas fa-home\",\"title\":null,\"description\":null},{\"icon\":\"fas fa-home\",\"title\":null,\"description\":null}]}',NULL,'2022-10-20 10:30:15'),(2,3,'feature','{\"id\":\"2\",\"title\":\"Features to skyrocket \\ud83d\\ude80 your business growth\",\"description\":\"<p>The pace of business growth has never been faster.<\\/p>\\r\\n<p>That\'s why we\\u2019ve designed our cloud-based POS software to help you get ahead.<\\/p>\\r\\n<p>The easiest, most reliable way to grow and manage your business is right at your fingertips with our cloud-based POS and inventory management system.<\\/p>\\r\\n<p>Right software can be a lifesaver for your business, and with it, you can revolutionize your business\'s growth<\\/p>\",\"content\":[{\"icon\":\"fas fa-cloud\",\"title\":\"Access Anywhere!\",\"description\":\"Check your business data from anywhere, anytime. \\r\\nSee live updates in realtime\"},{\"icon\":\"fas fa-check-double\",\"title\":\"No Installation\",\"description\":\"No software to install, No hardware dependency. Just open browser & start using.\"},{\"icon\":\"fas fa-sitemap\",\"title\":\"MultiBranches & Warehouse\",\"description\":\"Manage stock of multiple branches  in one place effortlessly & real-time.\"},{\"icon\":\"fas fa-user-lock\",\"title\":\"User access limit\",\"description\":\"Powerful user Role & Permission management to limit employees  access to business data\"},{\"icon\":\"fas fa-cubes\",\"title\":\"Stock Management\",\"description\":\"Manage stocks with from multiple locations, stock expiry, lot number, stock history & much more.\"},{\"icon\":\"fas fa-wrench\",\"title\":\"Service Management\",\"description\":\"Manage & easily invoice for services. Also dedicated repair service management features to schedule & deliver services on time\"},{\"icon\":\"fas fa-users\",\"title\":\"HR Management\",\"description\":\"With HR management easily track daily attendance, shift management, leaves, payroll, Holidays, Departments,  & Designations\"},{\"icon\":\"fas fa-handshake\",\"title\":\"Customer Management\",\"description\":\"CRM module help you to track leads lifecycle, followup with leads, sources, followup, launch campaigns, proposals and lot more\"},{\"icon\":\"fas fa-hand-peace\",\"title\":\"Simplified Interface\",\"description\":\"Simple to use interface to get work done in few clicks. Save your time & make it easy for staffs to use.\"},{\"icon\":\"fas fa-chart-line\",\"title\":\"Reports\",\"description\":\"Comes inbuilt with lot of report to help business owners analyse every revenue, inventory, payments & human resource.\"}]}','2022-09-15 09:34:41','2023-08-29 06:15:11');
/*!40000 ALTER TABLE `cms_page_metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pages`
--

DROP TABLE IF EXISTS `cms_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) NOT NULL,
  `layout` varchar(191) DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `content` longtext DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `tags` varchar(191) DEFAULT NULL,
  `feature_image` varchar(191) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pages`
--

LOCK TABLES `cms_pages` WRITE;
/*!40000 ALTER TABLE `cms_pages` DISABLE KEYS */;
INSERT INTO `cms_pages` VALUES (1,'testimonial',NULL,'David Parr','<p class=\"testimonial-card-1__paragraph mb-3\">This software has become one of the backbones of our business. It helped us streamline the data of all our warehouses &amp; shops on one platform. I am not much of a techy guy but the admin panel also allows you to customize every aspect of the application.</p>\n          <p class=\"testimonial-card-1__paragraph mb-3\">All the reports help me to give an overview of different aspects of our business.</p>\n          <p class=\"testimonial-card-1__paragraph mb-3\">It is very powerful!</p>',NULL,NULL,NULL,3,9,1,'2022-08-19 05:25:05','2022-10-20 11:48:29'),(2,'testimonial',NULL,'Tim Johnson','<p>It is truly designed to help my business run more smoothly and efficiently. I can now track and manage inventory, customer information, and sales easily. The installation was quick and easy, and the interface is very user-friendly. I can now manage almost every business operation with one single software!</p>',NULL,NULL,NULL,NULL,1,1,'2022-09-10 10:07:17','2022-10-20 11:23:39'),(3,'page','home','Automate your business management at very-Low cost','<p>Best POS, Invoicing, Inventory &amp; Service management application for your growing business!</p>',NULL,NULL,'1693247476_ijVI1kwud2k9Th3miQFq5atC2Vdx1P9ondnaUgzM.jpg',1,0,1,'2022-09-10 10:26:24','2023-08-29 06:15:11'),(4,'page','contact','Contact Us','<p>We\'re happy to receive your message. Ask us anything, we\'ll respond as soon as possible.</p>',NULL,NULL,NULL,NULL,0,1,'2022-09-10 10:26:24','2022-09-16 06:04:20'),(5,'testimonial',NULL,'Krishna Watt','<p>We have used this for 9 months now. It has helped our business grow by leaps and bounds. The interface and its simplicity have made it easy for us to learn and get familiar with. The best thing about this software is that it is cloud-based and we can use it from our shop, warehouse, or mobile while traveling. I can also see its potential as we continue to grow. Highly Satisfied!</p>',NULL,NULL,NULL,NULL,1,1,'2022-09-16 06:07:25','2022-10-20 11:27:31');
/*!40000 ALTER TABLE `cms_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_site_details`
--

DROP TABLE IF EXISTS `cms_site_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_site_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `site_key` varchar(191) NOT NULL,
  `site_value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_site_details`
--

LOCK TABLES `cms_site_details` WRITE;
/*!40000 ALTER TABLE `cms_site_details` DISABLE KEYS */;
INSERT INTO `cms_site_details` VALUES (1,'faqs','[{\"question\":\"Why should we switch to cloud-based business management software compared to traditional desktop software?\",\"answer\":\"Cloud-based software provides you a low-cost, secure & mobile software solutions. Compared to traditional software that requires it to install on a computer - cloud-based can be accessed from anywhere without any hardware dependency.\"},{\"question\":\"How secure is my business data?\",\"answer\":\"All data are stored in our centralized database which is highly protected with multi-layers of privileges. We takes regular frequency interval automated backup to protect from any unwanted consequences.\"},{\"question\":\"Whom should I reach out to in case of any problems?\",\"answer\":\"Please contact our support, write us in the contact section or call to the number mentioned. You\'re assured to receive a response in a maximum of 24 hours.\"},{\"question\":\"Is this POS application Free?\",\"answer\":\"We do provide a free tier for very small business or business that is about to start. To take more advantage of this POS software we recommend that you upgrade to a better plan that unlocks more features.\"},{\"question\":\"Do you provide consultancy or implementation solutions for using this POS software?\",\"answer\":\"Yes, with a pro plan you can connect with one of our experts who will help you with implementing the solution for your business.\"},{\"question\":\"Are there any additional hardware required or subscription charges?\",\"answer\":\"This is cloud-based software. You\'ll only need a device with an internet connection & chrome browser. It runs within the browser. No additional hardware is required. But you can use some hardware like barcode scanners, and printers for your convenience to speed up work.\"}]','2022-09-13 12:44:10','2022-10-20 11:16:28'),(2,'statistics','{\"tagline\":\"POS\'s Stats & Numbers\",\"description\":\"More & More businesses are adopting our cloud-based business management solution\",\"content\":[{\"stats\":\"75\",\"title\":\"REGISTERED BUSINESSES\"},{\"stats\":\"400+\",\"title\":\"DAILY USERS\"},{\"stats\":\"50K\",\"title\":\"INVOICES CREATED\"},{\"stats\":\"126+\",\"title\":\"ONLINE RESOURCES\"}]}','2022-09-13 12:44:10','2022-10-20 11:08:07'),(3,'google_analytics','null','2022-09-14 05:14:40','2022-09-16 05:49:09'),(4,'fb_pixel','null','2022-09-14 05:14:40','2022-09-16 05:49:09'),(5,'custom_js','null','2022-09-14 05:14:40','2022-09-16 05:49:09'),(6,'custom_css','null','2022-09-14 05:14:40','2022-09-16 05:49:09'),(7,'meta_tags','null','2022-09-14 05:14:40','2022-09-16 05:49:09'),(8,'chat_widget','null','2022-09-14 05:27:14','2022-09-16 05:49:09'),(9,'contact_us','[{\"label\":\"Call\",\"num\":\"0000000000\"},{\"label\":\"Support\",\"num\":\"0000000000\"},{\"label\":\"Enquiry\",\"num\":\"0000000000\"}]','2022-09-14 06:24:38','2022-09-16 05:49:09'),(10,'mail_us','[{\"label\":\"Contact\",\"email\":\"contact@example.com\"},{\"label\":\"Support\",\"email\":\"support@example.com\"}]','2022-09-14 06:24:38','2022-09-16 05:49:09'),(11,'follow_us','{\"facebook\":\"https:\\/\\/www.facebook.com\\/test\",\"instagram\":\"https:\\/\\/www.instagram.com\\/test\",\"twitter\":\"https:\\/\\/twitter.com\\/test\",\"linkedin\":\"https:\\/\\/in.linkedin.com\\/company\\/test\",\"youtube\":\"https:\\/\\/www.youtube.com\\/c\\/test\"}','2022-09-14 06:35:39','2022-10-20 11:08:07'),(12,'logo','null','2022-09-14 07:38:53','2022-09-16 05:49:09'),(13,'notifiable_email','\"notifyme@example.com\"','2022-09-14 07:38:53','2022-09-16 05:49:09');
/*!40000 ALTER TABLE `cms_site_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `type` varchar(191) NOT NULL,
  `supplier_business_name` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `prefix` varchar(191) DEFAULT NULL,
  `first_name` varchar(191) DEFAULT NULL,
  `middle_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `contact_id` varchar(191) DEFAULT NULL,
  `contact_status` varchar(191) NOT NULL DEFAULT 'active',
  `tax_number` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `address_line_1` text DEFAULT NULL,
  `address_line_2` text DEFAULT NULL,
  `zip_code` varchar(191) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(191) NOT NULL,
  `landline` varchar(191) DEFAULT NULL,
  `alternate_number` varchar(191) DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') DEFAULT NULL,
  `credit_limit` decimal(22,4) DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `balance` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `total_rp` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_used` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_address` text DEFAULT NULL,
  `shipping_custom_field_details` longtext DEFAULT NULL,
  `is_export` tinyint(1) NOT NULL DEFAULT 0,
  `export_custom_field_1` varchar(191) DEFAULT NULL,
  `export_custom_field_2` varchar(191) DEFAULT NULL,
  `export_custom_field_3` varchar(191) DEFAULT NULL,
  `export_custom_field_4` varchar(191) DEFAULT NULL,
  `export_custom_field_5` varchar(191) DEFAULT NULL,
  `export_custom_field_6` varchar(191) DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `custom_field1` varchar(191) DEFAULT NULL,
  `custom_field2` varchar(191) DEFAULT NULL,
  `custom_field3` varchar(191) DEFAULT NULL,
  `custom_field4` varchar(191) DEFAULT NULL,
  `custom_field5` varchar(191) DEFAULT NULL,
  `custom_field6` varchar(191) DEFAULT NULL,
  `custom_field7` varchar(191) DEFAULT NULL,
  `custom_field8` varchar(191) DEFAULT NULL,
  `custom_field9` varchar(191) DEFAULT NULL,
  `custom_field10` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contacts_business_id_foreign` (`business_id`),
  KEY `contacts_created_by_foreign` (`created_by`),
  KEY `contacts_type_index` (`type`),
  KEY `contacts_contact_status_index` (`contact_status`),
  CONSTRAINT `contacts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,1,'customer',NULL,'Walk-In Customer',NULL,NULL,NULL,NULL,NULL,'CO0001','active',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0.0000,1,0.0000,0,0,0,1,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-08-28 17:44:13','2023-08-28 17:44:13');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(100) NOT NULL,
  `currency` varchar(100) NOT NULL,
  `code` varchar(25) NOT NULL,
  `symbol` varchar(25) NOT NULL,
  `thousand_separator` varchar(10) NOT NULL,
  `decimal_separator` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'Albania','Leke','ALL','Lek',',','.',NULL,NULL),(2,'America','Dollars','USD','$',',','.',NULL,NULL),(3,'Afghanistan','Afghanis','AF','؋',',','.',NULL,NULL),(4,'Argentina','Pesos','ARS','$',',','.',NULL,NULL),(5,'Aruba','Guilders','AWG','ƒ',',','.',NULL,NULL),(6,'Australia','Dollars','AUD','$',',','.',NULL,NULL),(7,'Azerbaijan','New Manats','AZ','ман',',','.',NULL,NULL),(8,'Bahamas','Dollars','BSD','$',',','.',NULL,NULL),(9,'Barbados','Dollars','BBD','$',',','.',NULL,NULL),(10,'Belarus','Rubles','BYR','p.',',','.',NULL,NULL),(11,'Belgium','Euro','EUR','€',',','.',NULL,NULL),(12,'Beliz','Dollars','BZD','BZ$',',','.',NULL,NULL),(13,'Bermuda','Dollars','BMD','$',',','.',NULL,NULL),(14,'Bolivia','Bolivianos','BOB','$b',',','.',NULL,NULL),(15,'Bosnia and Herzegovina','Convertible Marka','BAM','KM',',','.',NULL,NULL),(16,'Botswana','Pula\'s','BWP','P',',','.',NULL,NULL),(17,'Bulgaria','Leva','BG','лв',',','.',NULL,NULL),(18,'Brazil','Reais','BRL','R$',',','.',NULL,NULL),(19,'Britain [United Kingdom]','Pounds','GBP','£',',','.',NULL,NULL),(20,'Brunei Darussalam','Dollars','BND','$',',','.',NULL,NULL),(21,'Cambodia','Riels','KHR','៛',',','.',NULL,NULL),(22,'Canada','Dollars','CAD','$',',','.',NULL,NULL),(23,'Cayman Islands','Dollars','KYD','$',',','.',NULL,NULL),(24,'Chile','Pesos','CLP','$',',','.',NULL,NULL),(25,'China','Yuan Renminbi','CNY','¥',',','.',NULL,NULL),(26,'Colombia','Pesos','COP','$',',','.',NULL,NULL),(27,'Costa Rica','Colón','CRC','₡',',','.',NULL,NULL),(28,'Croatia','Kuna','HRK','kn',',','.',NULL,NULL),(29,'Cuba','Pesos','CUP','₱',',','.',NULL,NULL),(30,'Cyprus','Euro','EUR','€','.',',',NULL,NULL),(31,'Czech Republic','Koruny','CZK','Kč',',','.',NULL,NULL),(32,'Denmark','Kroner','DKK','kr',',','.',NULL,NULL),(33,'Dominican Republic','Pesos','DOP ','RD$',',','.',NULL,NULL),(34,'East Caribbean','Dollars','XCD','$',',','.',NULL,NULL),(35,'Egypt','Pounds','EGP','£',',','.',NULL,NULL),(36,'El Salvador','Colones','SVC','$',',','.',NULL,NULL),(37,'England [United Kingdom]','Pounds','GBP','£',',','.',NULL,NULL),(38,'Euro','Euro','EUR','€','.',',',NULL,NULL),(39,'Falkland Islands','Pounds','FKP','£',',','.',NULL,NULL),(40,'Fiji','Dollars','FJD','$',',','.',NULL,NULL),(41,'France','Euro','EUR','€','.',',',NULL,NULL),(42,'Ghana','Cedis','GHS','¢',',','.',NULL,NULL),(43,'Gibraltar','Pounds','GIP','£',',','.',NULL,NULL),(44,'Greece','Euro','EUR','€','.',',',NULL,NULL),(45,'Guatemala','Quetzales','GTQ','Q',',','.',NULL,NULL),(46,'Guernsey','Pounds','GGP','£',',','.',NULL,NULL),(47,'Guyana','Dollars','GYD','$',',','.',NULL,NULL),(48,'Holland [Netherlands]','Euro','EUR','€','.',',',NULL,NULL),(49,'Honduras','Lempiras','HNL','L',',','.',NULL,NULL),(50,'Hong Kong','Dollars','HKD','$',',','.',NULL,NULL),(51,'Hungary','Forint','HUF','Ft',',','.',NULL,NULL),(52,'Iceland','Kronur','ISK','kr',',','.',NULL,NULL),(53,'India','Rupees','INR','₹',',','.',NULL,NULL),(54,'Indonesia','Rupiahs','IDR','Rp',',','.',NULL,NULL),(55,'Iran','Rials','IRR','﷼',',','.',NULL,NULL),(56,'Ireland','Euro','EUR','€','.',',',NULL,NULL),(57,'Isle of Man','Pounds','IMP','£',',','.',NULL,NULL),(58,'Israel','New Shekels','ILS','₪',',','.',NULL,NULL),(59,'Italy','Euro','EUR','€','.',',',NULL,NULL),(60,'Jamaica','Dollars','JMD','J$',',','.',NULL,NULL),(61,'Japan','Yen','JPY','¥',',','.',NULL,NULL),(62,'Jersey','Pounds','JEP','£',',','.',NULL,NULL),(63,'Kazakhstan','Tenge','KZT','лв',',','.',NULL,NULL),(64,'Korea [North]','Won','KPW','₩',',','.',NULL,NULL),(65,'Korea [South]','Won','KRW','₩',',','.',NULL,NULL),(66,'Kyrgyzstan','Soms','KGS','лв',',','.',NULL,NULL),(67,'Laos','Kips','LAK','₭',',','.',NULL,NULL),(68,'Latvia','Lati','LVL','Ls',',','.',NULL,NULL),(69,'Lebanon','Pounds','LBP','£',',','.',NULL,NULL),(70,'Liberia','Dollars','LRD','$',',','.',NULL,NULL),(71,'Liechtenstein','Switzerland Francs','CHF','CHF',',','.',NULL,NULL),(72,'Lithuania','Litai','LTL','Lt',',','.',NULL,NULL),(73,'Luxembourg','Euro','EUR','€','.',',',NULL,NULL),(74,'Macedonia','Denars','MKD','ден',',','.',NULL,NULL),(75,'Malaysia','Ringgits','MYR','RM',',','.',NULL,NULL),(76,'Malta','Euro','EUR','€','.',',',NULL,NULL),(77,'Mauritius','Rupees','MUR','₨',',','.',NULL,NULL),(78,'Mexico','Pesos','MXN','$',',','.',NULL,NULL),(79,'Mongolia','Tugriks','MNT','₮',',','.',NULL,NULL),(80,'Mozambique','Meticais','MZ','MT',',','.',NULL,NULL),(81,'Namibia','Dollars','NAD','$',',','.',NULL,NULL),(82,'Nepal','Rupees','NPR','₨',',','.',NULL,NULL),(83,'Netherlands Antilles','Guilders','ANG','ƒ',',','.',NULL,NULL),(84,'Netherlands','Euro','EUR','€','.',',',NULL,NULL),(85,'New Zealand','Dollars','NZD','$',',','.',NULL,NULL),(86,'Nicaragua','Cordobas','NIO','C$',',','.',NULL,NULL),(87,'Nigeria','Nairas','NGN','₦',',','.',NULL,NULL),(88,'North Korea','Won','KPW','₩',',','.',NULL,NULL),(89,'Norway','Krone','NOK','kr',',','.',NULL,NULL),(90,'Oman','Rials','OMR','﷼',',','.',NULL,NULL),(91,'Pakistan','Rupees','PKR','₨',',','.',NULL,NULL),(92,'Panama','Balboa','PAB','B/.',',','.',NULL,NULL),(93,'Paraguay','Guarani','PYG','Gs',',','.',NULL,NULL),(94,'Peru','Nuevos Soles','PE','S/.',',','.',NULL,NULL),(95,'Philippines','Pesos','PHP','Php',',','.',NULL,NULL),(96,'Poland','Zlotych','PL','zł',',','.',NULL,NULL),(97,'Qatar','Rials','QAR','﷼',',','.',NULL,NULL),(98,'Romania','New Lei','RO','lei',',','.',NULL,NULL),(99,'Russia','Rubles','RUB','руб',',','.',NULL,NULL),(100,'Saint Helena','Pounds','SHP','£',',','.',NULL,NULL),(101,'Saudi Arabia','Riyals','SAR','﷼',',','.',NULL,NULL),(102,'Serbia','Dinars','RSD','Дин.',',','.',NULL,NULL),(103,'Seychelles','Rupees','SCR','₨',',','.',NULL,NULL),(104,'Singapore','Dollars','SGD','$',',','.',NULL,NULL),(105,'Slovenia','Euro','EUR','€','.',',',NULL,NULL),(106,'Solomon Islands','Dollars','SBD','$',',','.',NULL,NULL),(107,'Somalia','Shillings','SOS','S',',','.',NULL,NULL),(108,'South Africa','Rand','ZAR','R',',','.',NULL,NULL),(109,'South Korea','Won','KRW','₩',',','.',NULL,NULL),(110,'Spain','Euro','EUR','€','.',',',NULL,NULL),(111,'Sri Lanka','Rupees','LKR','₨',',','.',NULL,NULL),(112,'Sweden','Kronor','SEK','kr',',','.',NULL,NULL),(113,'Switzerland','Francs','CHF','CHF',',','.',NULL,NULL),(114,'Suriname','Dollars','SRD','$',',','.',NULL,NULL),(115,'Syria','Pounds','SYP','£',',','.',NULL,NULL),(116,'Taiwan','New Dollars','TWD','NT$',',','.',NULL,NULL),(117,'Thailand','Baht','THB','฿',',','.',NULL,NULL),(118,'Trinidad and Tobago','Dollars','TTD','TT$',',','.',NULL,NULL),(119,'Turkey','Lira','TRY','TL',',','.',NULL,NULL),(120,'Turkey','Liras','TRL','£',',','.',NULL,NULL),(121,'Tuvalu','Dollars','TVD','$',',','.',NULL,NULL),(122,'Ukraine','Hryvnia','UAH','₴',',','.',NULL,NULL),(123,'United Kingdom','Pounds','GBP','£',',','.',NULL,NULL),(124,'United States of America','Dollars','USD','$',',','.',NULL,NULL),(125,'Uruguay','Pesos','UYU','$U',',','.',NULL,NULL),(126,'Uzbekistan','Sums','UZS','лв',',','.',NULL,NULL),(127,'Vatican City','Euro','EUR','€','.',',',NULL,NULL),(128,'Venezuela','Bolivares Fuertes','VEF','Bs',',','.',NULL,NULL),(129,'Vietnam','Dong','VND','₫',',','.',NULL,NULL),(130,'Yemen','Rials','YER','﷼',',','.',NULL,NULL),(131,'Zimbabwe','Zimbabwe Dollars','ZWD','Z$',',','.',NULL,NULL),(132,'Iraq','Iraqi dinar','IQD','د.ع',',','.',NULL,NULL),(133,'Kenya','Kenyan shilling','KES','KSh',',','.',NULL,NULL),(134,'Bangladesh','Taka','BDT','৳',',','.',NULL,NULL),(135,'Algerie','Algerian dinar','DZD','د.ج',' ','.',NULL,NULL),(136,'United Arab Emirates','United Arab Emirates dirham','AED','د.إ',',','.',NULL,NULL),(137,'Uganda','Uganda shillings','UGX','USh',',','.',NULL,NULL),(138,'Tanzania','Tanzanian shilling','TZS','TSh',',','.',NULL,NULL),(139,'Angola','Kwanza','AOA','Kz',',','.',NULL,NULL),(140,'Kuwait','Kuwaiti dinar','KWD','KD',',','.',NULL,NULL),(141,'Bahrain','Bahraini dinar','BHD','BD',',','.',NULL,NULL);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_groups`
--

DROP TABLE IF EXISTS `customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `amount` double(5,2) NOT NULL,
  `price_calculation_type` varchar(191) DEFAULT 'percentage',
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_groups_business_id_foreign` (`business_id`),
  KEY `customer_groups_created_by_index` (`created_by`),
  KEY `customer_groups_price_calculation_type_index` (`price_calculation_type`),
  KEY `customer_groups_selling_price_group_id_index` (`selling_price_group_id`),
  CONSTRAINT `customer_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_groups`
--

LOCK TABLES `customer_groups` WRITE;
/*!40000 ALTER TABLE `customer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_configurations`
--

DROP TABLE IF EXISTS `dashboard_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_configurations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `color` varchar(191) NOT NULL,
  `configuration` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_configurations_business_id_foreign` (`business_id`),
  CONSTRAINT `dashboard_configurations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_configurations`
--

LOCK TABLES `dashboard_configurations` WRITE;
/*!40000 ALTER TABLE `dashboard_configurations` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_variations`
--

DROP TABLE IF EXISTS `discount_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_variations` (
  `discount_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL,
  KEY `discount_variations_discount_id_index` (`discount_id`),
  KEY `discount_variations_variation_id_index` (`variation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_variations`
--

LOCK TABLES `discount_variations` WRITE;
/*!40000 ALTER TABLE `discount_variations` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `business_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `discount_type` varchar(191) DEFAULT NULL,
  `discount_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `spg` varchar(100) DEFAULT NULL COMMENT 'Applicable in specified selling price group only. Use of applicable_in_spg column is discontinued',
  `applicable_in_cg` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discounts_business_id_index` (`business_id`),
  KEY `discounts_brand_id_index` (`brand_id`),
  KEY `discounts_category_id_index` (`category_id`),
  KEY `discounts_location_id_index` (`location_id`),
  KEY `discounts_priority_index` (`priority`),
  KEY `discounts_spg_index` (`spg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_and_notes`
--

DROP TABLE IF EXISTS `document_and_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_and_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `notable_id` int(11) NOT NULL,
  `notable_type` varchar(191) NOT NULL,
  `heading` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_and_notes_business_id_index` (`business_id`),
  KEY `document_and_notes_notable_id_index` (`notable_id`),
  KEY `document_and_notes_created_by_index` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_and_notes`
--

LOCK TABLES `document_and_notes` WRITE;
/*!40000 ALTER TABLE `document_and_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_and_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_allowances_and_deductions`
--

DROP TABLE IF EXISTS `essentials_allowances_and_deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_allowances_and_deductions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `description` varchar(191) NOT NULL,
  `type` enum('allowance','deduction') NOT NULL,
  `amount` decimal(22,4) NOT NULL,
  `amount_type` enum('fixed','percent') NOT NULL,
  `applicable_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_allowances_and_deductions_business_id_index` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_allowances_and_deductions`
--

LOCK TABLES `essentials_allowances_and_deductions` WRITE;
/*!40000 ALTER TABLE `essentials_allowances_and_deductions` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_allowances_and_deductions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_attendances`
--

DROP TABLE IF EXISTS `essentials_attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_attendances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `clock_in_time` datetime DEFAULT NULL,
  `clock_out_time` datetime DEFAULT NULL,
  `essentials_shift_id` int(11) DEFAULT NULL,
  `ip_address` varchar(191) DEFAULT NULL,
  `clock_in_note` text DEFAULT NULL,
  `clock_out_note` text DEFAULT NULL,
  `clock_in_location` text DEFAULT NULL,
  `clock_out_location` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_attendances_user_id_index` (`user_id`),
  KEY `essentials_attendances_business_id_index` (`business_id`),
  KEY `essentials_attendances_essentials_shift_id_index` (`essentials_shift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_attendances`
--

LOCK TABLES `essentials_attendances` WRITE;
/*!40000 ALTER TABLE `essentials_attendances` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_document_shares`
--

DROP TABLE IF EXISTS `essentials_document_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_document_shares` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `value_type` enum('user','role') NOT NULL,
  `value` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_document_shares_document_id_index` (`document_id`),
  KEY `essentials_document_shares_value_type_index` (`value_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_document_shares`
--

LOCK TABLES `essentials_document_shares` WRITE;
/*!40000 ALTER TABLE `essentials_document_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_document_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_documents`
--

DROP TABLE IF EXISTS `essentials_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_documents`
--

LOCK TABLES `essentials_documents` WRITE;
/*!40000 ALTER TABLE `essentials_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_holidays`
--

DROP TABLE IF EXISTS `essentials_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_holidays` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `business_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_holidays_business_id_index` (`business_id`),
  KEY `essentials_holidays_location_id_index` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_holidays`
--

LOCK TABLES `essentials_holidays` WRITE;
/*!40000 ALTER TABLE `essentials_holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_kb`
--

DROP TABLE IF EXISTS `essentials_kb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_kb` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` bigint(20) unsigned NOT NULL,
  `title` varchar(191) NOT NULL,
  `content` longtext DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `kb_type` varchar(191) NOT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL COMMENT 'id from essentials_kb table',
  `share_with` varchar(191) DEFAULT NULL COMMENT 'public, private, only_with',
  `created_by` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_kb_business_id_index` (`business_id`),
  KEY `essentials_kb_parent_id_index` (`parent_id`),
  KEY `essentials_kb_created_by_index` (`created_by`),
  CONSTRAINT `essentials_kb_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `essentials_kb` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_kb`
--

LOCK TABLES `essentials_kb` WRITE;
/*!40000 ALTER TABLE `essentials_kb` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_kb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_kb_users`
--

DROP TABLE IF EXISTS `essentials_kb_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_kb_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kb_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_kb_users_kb_id_index` (`kb_id`),
  KEY `essentials_kb_users_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_kb_users`
--

LOCK TABLES `essentials_kb_users` WRITE;
/*!40000 ALTER TABLE `essentials_kb_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_kb_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_leave_types`
--

DROP TABLE IF EXISTS `essentials_leave_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_leave_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `leave_type` varchar(191) NOT NULL,
  `max_leave_count` int(11) DEFAULT NULL,
  `leave_count_interval` enum('month','year') DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_leave_types_business_id_index` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_leave_types`
--

LOCK TABLES `essentials_leave_types` WRITE;
/*!40000 ALTER TABLE `essentials_leave_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_leave_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_leaves`
--

DROP TABLE IF EXISTS `essentials_leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_leaves` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `essentials_leave_type_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `ref_no` varchar(191) DEFAULT NULL,
  `status` enum('pending','approved','cancelled') DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `status_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_leaves_essentials_leave_type_id_index` (`essentials_leave_type_id`),
  KEY `essentials_leaves_business_id_index` (`business_id`),
  KEY `essentials_leaves_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_leaves`
--

LOCK TABLES `essentials_leaves` WRITE;
/*!40000 ALTER TABLE `essentials_leaves` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_messages`
--

DROP TABLE IF EXISTS `essentials_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_messages_business_id_index` (`business_id`),
  KEY `essentials_messages_user_id_index` (`user_id`),
  KEY `essentials_messages_location_id_index` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_messages`
--

LOCK TABLES `essentials_messages` WRITE;
/*!40000 ALTER TABLE `essentials_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_payroll_group_transactions`
--

DROP TABLE IF EXISTS `essentials_payroll_group_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_payroll_group_transactions` (
  `payroll_group_id` bigint(20) unsigned NOT NULL,
  `transaction_id` int(11) NOT NULL,
  KEY `essentials_payroll_group_transactions_payroll_group_id_foreign` (`payroll_group_id`),
  CONSTRAINT `essentials_payroll_group_transactions_payroll_group_id_foreign` FOREIGN KEY (`payroll_group_id`) REFERENCES `essentials_payroll_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_payroll_group_transactions`
--

LOCK TABLES `essentials_payroll_group_transactions` WRITE;
/*!40000 ALTER TABLE `essentials_payroll_group_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_payroll_group_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_payroll_groups`
--

DROP TABLE IF EXISTS `essentials_payroll_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_payroll_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL COMMENT 'payroll for work location',
  `name` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `payment_status` varchar(191) NOT NULL DEFAULT 'due',
  `gross_total` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_payroll_groups`
--

LOCK TABLES `essentials_payroll_groups` WRITE;
/*!40000 ALTER TABLE `essentials_payroll_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_payroll_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_reminders`
--

DROP TABLE IF EXISTS `essentials_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_reminders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `end_time` time DEFAULT NULL,
  `repeat` enum('one_time','every_day','every_week','every_month') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_reminders_business_id_index` (`business_id`),
  KEY `essentials_reminders_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_reminders`
--

LOCK TABLES `essentials_reminders` WRITE;
/*!40000 ALTER TABLE `essentials_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_shifts`
--

DROP TABLE IF EXISTS `essentials_shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_shifts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `type` enum('fixed_shift','flexible_shift') NOT NULL DEFAULT 'fixed_shift',
  `business_id` int(11) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `is_allowed_auto_clockout` tinyint(1) NOT NULL DEFAULT 0,
  `auto_clockout_time` time DEFAULT NULL,
  `holidays` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_shifts_type_index` (`type`),
  KEY `essentials_shifts_business_id_index` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_shifts`
--

LOCK TABLES `essentials_shifts` WRITE;
/*!40000 ALTER TABLE `essentials_shifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_to_dos`
--

DROP TABLE IF EXISTS `essentials_to_dos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_to_dos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `task` text NOT NULL,
  `date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `task_id` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `estimated_hours` varchar(191) DEFAULT NULL,
  `priority` varchar(191) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_to_dos_status_index` (`status`),
  KEY `essentials_to_dos_priority_index` (`priority`),
  KEY `essentials_to_dos_created_by_index` (`created_by`),
  KEY `essentials_to_dos_business_id_index` (`business_id`),
  KEY `essentials_to_dos_task_id_index` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_to_dos`
--

LOCK TABLES `essentials_to_dos` WRITE;
/*!40000 ALTER TABLE `essentials_to_dos` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_to_dos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_todo_comments`
--

DROP TABLE IF EXISTS `essentials_todo_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_todo_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `task_id` int(11) NOT NULL,
  `comment_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_todo_comments_task_id_index` (`task_id`),
  KEY `essentials_todo_comments_comment_by_index` (`comment_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_todo_comments`
--

LOCK TABLES `essentials_todo_comments` WRITE;
/*!40000 ALTER TABLE `essentials_todo_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_todo_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_todos_users`
--

DROP TABLE IF EXISTS `essentials_todos_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_todos_users` (
  `todo_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_todos_users`
--

LOCK TABLES `essentials_todos_users` WRITE;
/*!40000 ALTER TABLE `essentials_todos_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_todos_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_user_allowance_and_deductions`
--

DROP TABLE IF EXISTS `essentials_user_allowance_and_deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_user_allowance_and_deductions` (
  `user_id` int(11) NOT NULL,
  `allowance_deduction_id` int(11) NOT NULL,
  KEY `essentials_user_allowance_and_deductions_user_id_index` (`user_id`),
  KEY `allow_deduct_index` (`allowance_deduction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_user_allowance_and_deductions`
--

LOCK TABLES `essentials_user_allowance_and_deductions` WRITE;
/*!40000 ALTER TABLE `essentials_user_allowance_and_deductions` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_user_allowance_and_deductions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_user_sales_targets`
--

DROP TABLE IF EXISTS `essentials_user_sales_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_user_sales_targets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `target_start` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `target_end` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `commission_percent` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_user_sales_targets`
--

LOCK TABLES `essentials_user_sales_targets` WRITE;
/*!40000 ALTER TABLE `essentials_user_sales_targets` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_user_sales_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_user_shifts`
--

DROP TABLE IF EXISTS `essentials_user_shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_user_shifts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `essentials_shift_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_user_shifts_user_id_index` (`user_id`),
  KEY `essentials_user_shifts_essentials_shift_id_index` (`essentials_shift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_user_shifts`
--

LOCK TABLES `essentials_user_shifts` WRITE;
/*!40000 ALTER TABLE `essentials_user_shifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_user_shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense_categories`
--

DROP TABLE IF EXISTS `expense_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) unsigned NOT NULL,
  `code` varchar(191) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expense_categories_business_id_foreign` (`business_id`),
  CONSTRAINT `expense_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_categories`
--

LOCK TABLES `expense_categories` WRITE;
/*!40000 ALTER TABLE `expense_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `expense_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_sub_taxes`
--

DROP TABLE IF EXISTS `group_sub_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_sub_taxes` (
  `group_tax_id` int(10) unsigned NOT NULL,
  `tax_id` int(10) unsigned NOT NULL,
  KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  KEY `group_sub_taxes_tax_id_foreign` (`tax_id`),
  CONSTRAINT `group_sub_taxes_group_tax_id_foreign` FOREIGN KEY (`group_tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `group_sub_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_sub_taxes`
--

LOCK TABLES `group_sub_taxes` WRITE;
/*!40000 ALTER TABLE `group_sub_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_sub_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_layouts`
--

DROP TABLE IF EXISTS `invoice_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_layouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `header_text` text DEFAULT NULL,
  `invoice_no_prefix` varchar(191) DEFAULT NULL,
  `quotation_no_prefix` varchar(191) DEFAULT NULL,
  `invoice_heading` varchar(191) DEFAULT NULL,
  `sub_heading_line1` varchar(191) DEFAULT NULL,
  `sub_heading_line2` varchar(191) DEFAULT NULL,
  `sub_heading_line3` varchar(191) DEFAULT NULL,
  `sub_heading_line4` varchar(191) DEFAULT NULL,
  `sub_heading_line5` varchar(191) DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) DEFAULT NULL,
  `invoice_heading_paid` varchar(191) DEFAULT NULL,
  `quotation_heading` varchar(191) DEFAULT NULL,
  `sub_total_label` varchar(191) DEFAULT NULL,
  `discount_label` varchar(191) DEFAULT NULL,
  `tax_label` varchar(191) DEFAULT NULL,
  `total_label` varchar(191) DEFAULT NULL,
  `round_off_label` varchar(191) DEFAULT NULL,
  `total_due_label` varchar(191) DEFAULT NULL,
  `paid_label` varchar(191) DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT 0,
  `client_id_label` varchar(191) DEFAULT NULL,
  `client_tax_label` varchar(191) DEFAULT NULL,
  `date_label` varchar(191) DEFAULT NULL,
  `date_time_format` varchar(191) DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT 1,
  `show_brand` tinyint(1) NOT NULL DEFAULT 0,
  `show_sku` tinyint(1) NOT NULL DEFAULT 1,
  `show_cat_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `show_lot` tinyint(1) NOT NULL DEFAULT 0,
  `show_image` tinyint(1) NOT NULL DEFAULT 0,
  `show_sale_description` tinyint(1) NOT NULL DEFAULT 0,
  `sales_person_label` varchar(191) DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT 0,
  `table_product_label` varchar(191) DEFAULT NULL,
  `table_qty_label` varchar(191) DEFAULT NULL,
  `table_unit_price_label` varchar(191) DEFAULT NULL,
  `table_subtotal_label` varchar(191) DEFAULT NULL,
  `cat_code_label` varchar(191) DEFAULT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT 0,
  `show_business_name` tinyint(1) NOT NULL DEFAULT 0,
  `show_location_name` tinyint(1) NOT NULL DEFAULT 1,
  `show_landmark` tinyint(1) NOT NULL DEFAULT 1,
  `show_city` tinyint(1) NOT NULL DEFAULT 1,
  `show_state` tinyint(1) NOT NULL DEFAULT 1,
  `show_zip_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_country` tinyint(1) NOT NULL DEFAULT 1,
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT 1,
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT 0,
  `show_email` tinyint(1) NOT NULL DEFAULT 0,
  `show_tax_1` tinyint(1) NOT NULL DEFAULT 1,
  `show_tax_2` tinyint(1) NOT NULL DEFAULT 0,
  `show_barcode` tinyint(1) NOT NULL DEFAULT 0,
  `show_payments` tinyint(1) NOT NULL DEFAULT 0,
  `show_customer` tinyint(1) NOT NULL DEFAULT 0,
  `customer_label` varchar(191) DEFAULT NULL,
  `commission_agent_label` varchar(191) DEFAULT NULL,
  `show_commission_agent` tinyint(1) NOT NULL DEFAULT 0,
  `show_reward_point` tinyint(1) NOT NULL DEFAULT 0,
  `highlight_color` varchar(10) DEFAULT NULL,
  `footer_text` text DEFAULT NULL,
  `module_info` text DEFAULT NULL,
  `common_settings` text DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `business_id` int(10) unsigned NOT NULL,
  `show_letter_head` tinyint(1) NOT NULL DEFAULT 0,
  `letter_head` varchar(191) DEFAULT NULL,
  `show_qr_code` tinyint(1) NOT NULL DEFAULT 0,
  `qr_code_fields` text DEFAULT NULL,
  `design` varchar(190) DEFAULT 'classic',
  `cn_heading` varchar(191) DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) DEFAULT NULL,
  `cn_amount_label` varchar(191) DEFAULT NULL,
  `table_tax_headings` text DEFAULT NULL,
  `show_previous_bal` tinyint(1) NOT NULL DEFAULT 0,
  `prev_bal_label` varchar(191) DEFAULT NULL,
  `change_return_label` varchar(191) DEFAULT NULL,
  `product_custom_fields` text DEFAULT NULL,
  `contact_custom_fields` text DEFAULT NULL,
  `location_custom_fields` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_layouts_business_id_foreign` (`business_id`),
  CONSTRAINT `invoice_layouts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_layouts`
--

LOCK TABLES `invoice_layouts` WRITE;
/*!40000 ALTER TABLE `invoice_layouts` DISABLE KEYS */;
INSERT INTO `invoice_layouts` VALUES (1,'Default',NULL,'Invoice No.',NULL,'Invoice',NULL,NULL,NULL,NULL,NULL,'','',NULL,'Subtotal','Discount','Tax','Total',NULL,'Total Due','Total Paid',0,NULL,NULL,'Date',NULL,1,0,1,1,0,0,0,0,NULL,0,'Product','Quantity','Unit Price','Subtotal',NULL,NULL,0,0,1,1,1,1,1,1,1,0,0,1,0,0,1,1,'Customer',NULL,0,0,'#000000','',NULL,NULL,1,1,0,NULL,0,NULL,'classic',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2023-08-28 17:44:13','2023-08-28 17:44:13');
/*!40000 ALTER TABLE `invoice_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_schemes`
--

DROP TABLE IF EXISTS `invoice_schemes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_schemes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `scheme_type` enum('blank','year') NOT NULL,
  `prefix` varchar(191) DEFAULT NULL,
  `start_number` int(11) DEFAULT NULL,
  `invoice_count` int(11) NOT NULL DEFAULT 0,
  `total_digits` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_schemes_business_id_foreign` (`business_id`),
  KEY `invoice_schemes_scheme_type_index` (`scheme_type`),
  CONSTRAINT `invoice_schemes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_schemes`
--

LOCK TABLES `invoice_schemes` WRITE;
/*!40000 ALTER TABLE `invoice_schemes` DISABLE KEYS */;
INSERT INTO `invoice_schemes` VALUES (1,1,'Default','blank','',1,1,4,1,'2023-08-28 17:44:13','2023-08-28 18:21:42');
/*!40000 ALTER TABLE `invoice_schemes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_media_type` varchar(191) DEFAULT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  KEY `media_business_id_index` (`business_id`),
  KEY `media_uploaded_by_index` (`uploaded_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfg_ingredient_groups`
--

DROP TABLE IF EXISTS `mfg_ingredient_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mfg_ingredient_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `business_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfg_ingredient_groups`
--

LOCK TABLES `mfg_ingredient_groups` WRITE;
/*!40000 ALTER TABLE `mfg_ingredient_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfg_ingredient_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfg_recipe_ingredients`
--

DROP TABLE IF EXISTS `mfg_recipe_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mfg_recipe_ingredients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mfg_recipe_id` int(10) unsigned NOT NULL,
  `variation_id` int(11) NOT NULL,
  `mfg_ingredient_group_id` int(11) DEFAULT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `waste_percent` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `sub_unit_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mfg_recipe_ingredients_mfg_recipe_id_foreign` (`mfg_recipe_id`),
  CONSTRAINT `mfg_recipe_ingredients_mfg_recipe_id_foreign` FOREIGN KEY (`mfg_recipe_id`) REFERENCES `mfg_recipes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfg_recipe_ingredients`
--

LOCK TABLES `mfg_recipe_ingredients` WRITE;
/*!40000 ALTER TABLE `mfg_recipe_ingredients` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfg_recipe_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfg_recipes`
--

DROP TABLE IF EXISTS `mfg_recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mfg_recipes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL,
  `instructions` text DEFAULT NULL,
  `waste_percent` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ingredients_cost` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `extra_cost` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `total_quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `final_price` decimal(22,4) NOT NULL,
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mfg_recipes_product_id_index` (`product_id`),
  KEY `mfg_recipes_variation_id_index` (`variation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfg_recipes`
--

LOCK TABLES `mfg_recipes` WRITE;
/*!40000 ALTER TABLE `mfg_recipes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfg_recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2017_07_05_071953_create_currencies_table',1),(9,'2017_07_05_073658_create_business_table',1),(10,'2017_07_22_075923_add_business_id_users_table',1),(11,'2017_07_23_113209_create_brands_table',1),(12,'2017_07_26_083429_create_permission_tables',1),(13,'2017_07_26_110000_create_tax_rates_table',1),(14,'2017_07_26_122313_create_units_table',1),(15,'2017_07_27_075706_create_contacts_table',1),(16,'2017_08_04_071038_create_categories_table',1),(17,'2017_08_08_115903_create_products_table',1),(18,'2017_08_09_061616_create_variation_templates_table',1),(19,'2017_08_09_061638_create_variation_value_templates_table',1),(20,'2017_08_10_061146_create_product_variations_table',1),(21,'2017_08_10_061216_create_variations_table',1),(22,'2017_08_19_054827_create_transactions_table',1),(23,'2017_08_31_073533_create_purchase_lines_table',1),(24,'2017_10_15_064638_create_transaction_payments_table',1),(25,'2017_10_31_065621_add_default_sales_tax_to_business_table',1),(26,'2017_11_20_051930_create_table_group_sub_taxes',1),(27,'2017_11_20_063603_create_transaction_sell_lines',1),(28,'2017_11_21_064540_create_barcodes_table',1),(29,'2017_11_23_181237_create_invoice_schemes_table',1),(30,'2017_12_25_122822_create_business_locations_table',1),(31,'2017_12_25_160253_add_location_id_to_transactions_table',1),(32,'2017_12_25_163227_create_variation_location_details_table',1),(33,'2018_01_04_115627_create_sessions_table',1),(34,'2018_01_05_112817_create_invoice_layouts_table',1),(35,'2018_01_06_112303_add_invoice_scheme_id_and_invoice_layout_id_to_business_locations',1),(36,'2018_01_08_104124_create_expense_categories_table',1),(37,'2018_01_08_123327_modify_transactions_table_for_expenses',1),(38,'2018_01_09_111005_modify_payment_status_in_transactions_table',1),(39,'2018_01_09_111109_add_paid_on_column_to_transaction_payments_table',1),(40,'2018_01_25_172439_add_printer_related_fields_to_business_locations_table',1),(41,'2018_01_27_184322_create_printers_table',1),(42,'2018_01_30_181442_create_cash_registers_table',1),(43,'2018_01_31_125836_create_cash_register_transactions_table',1),(44,'2018_02_07_173326_modify_business_table',1),(45,'2018_02_08_105425_add_enable_product_expiry_column_to_business_table',1),(46,'2018_02_08_111027_add_expiry_period_and_expiry_period_type_columns_to_products_table',1),(47,'2018_02_08_131118_add_mfg_date_and_exp_date_purchase_lines_table',1),(48,'2018_02_08_155348_add_exchange_rate_to_transactions_table',1),(49,'2018_02_09_124945_modify_transaction_payments_table_for_contact_payments',1),(50,'2018_02_12_113640_create_transaction_sell_lines_purchase_lines_table',1),(51,'2018_02_12_114605_add_quantity_sold_in_purchase_lines_table',1),(52,'2018_02_13_183323_alter_decimal_fields_size',1),(53,'2018_02_14_161928_add_transaction_edit_days_to_business_table',1),(54,'2018_02_15_161032_add_document_column_to_transactions_table',1),(55,'2018_02_17_124709_add_more_options_to_invoice_layouts',1),(56,'2018_02_19_111517_add_keyboard_shortcut_column_to_business_table',1),(57,'2018_02_19_121537_stock_adjustment_move_to_transaction_table',1),(58,'2018_02_20_165505_add_is_direct_sale_column_to_transactions_table',1),(59,'2018_02_21_105329_create_system_table',1),(60,'2018_02_23_100549_version_1_2',1),(61,'2018_02_23_125648_add_enable_editing_sp_from_purchase_column_to_business_table',1),(62,'2018_02_26_103612_add_sales_commission_agent_column_to_business_table',1),(63,'2018_02_26_130519_modify_users_table_for_sales_cmmsn_agnt',1),(64,'2018_02_26_134500_add_commission_agent_to_transactions_table',1),(65,'2018_02_27_121422_add_item_addition_method_to_business_table',1),(66,'2018_02_27_170232_modify_transactions_table_for_stock_transfer',1),(67,'2018_03_05_153510_add_enable_inline_tax_column_to_business_table',1),(68,'2018_03_06_210206_modify_product_barcode_types',1),(69,'2018_03_13_181541_add_expiry_type_to_business_table',1),(70,'2018_03_16_113446_product_expiry_setting_for_business',1),(71,'2018_03_19_113601_add_business_settings_options',1),(72,'2018_03_26_125334_add_pos_settings_to_business_table',1),(73,'2018_03_26_165350_create_customer_groups_table',1),(74,'2018_03_27_122720_customer_group_related_changes_in_tables',1),(75,'2018_03_29_110138_change_tax_field_to_nullable_in_business_table',1),(76,'2018_03_29_115502_add_changes_for_sr_number_in_products_and_sale_lines_table',1),(77,'2018_03_29_134340_add_inline_discount_fields_in_purchase_lines',1),(78,'2018_03_31_140921_update_transactions_table_exchange_rate',1),(79,'2018_04_03_103037_add_contact_id_to_contacts_table',1),(80,'2018_04_03_122709_add_changes_to_invoice_layouts_table',1),(81,'2018_04_09_135320_change_exchage_rate_size_in_business_table',1),(82,'2018_04_17_123122_add_lot_number_to_business',1),(83,'2018_04_17_160845_add_product_racks_table',1),(84,'2018_04_20_182015_create_res_tables_table',1),(85,'2018_04_24_105246_restaurant_fields_in_transaction_table',1),(86,'2018_04_24_114149_add_enabled_modules_business_table',1),(87,'2018_04_24_133704_add_modules_fields_in_invoice_layout_table',1),(88,'2018_04_27_132653_quotation_related_change',1),(89,'2018_05_02_104439_add_date_format_and_time_format_to_business',1),(90,'2018_05_02_111939_add_sell_return_to_transaction_payments',1),(91,'2018_05_14_114027_add_rows_positions_for_products',1),(92,'2018_05_14_125223_add_weight_to_products_table',1),(93,'2018_05_14_164754_add_opening_stock_permission',1),(94,'2018_05_15_134729_add_design_to_invoice_layouts',1),(95,'2018_05_16_183307_add_tax_fields_invoice_layout',1),(96,'2018_05_18_191956_add_sell_return_to_transaction_table',1),(97,'2018_05_21_131349_add_custom_fileds_to_contacts_table',1),(98,'2018_05_21_131607_invoice_layout_fields_for_sell_return',1),(99,'2018_05_21_131949_add_custom_fileds_and_website_to_business_locations_table',1),(100,'2018_05_22_123527_create_reference_counts_table',1),(101,'2018_05_22_154540_add_ref_no_prefixes_column_to_business_table',1),(102,'2018_05_24_132620_add_ref_no_column_to_transaction_payments_table',1),(103,'2018_05_24_161026_add_location_id_column_to_business_location_table',1),(104,'2018_05_25_180603_create_modifiers_related_table',1),(105,'2018_05_29_121714_add_purchase_line_id_to_stock_adjustment_line_table',1),(106,'2018_05_31_114645_add_res_order_status_column_to_transactions_table',1),(107,'2018_06_05_103530_rename_purchase_line_id_in_stock_adjustment_lines_table',1),(108,'2018_06_05_111905_modify_products_table_for_modifiers',1),(109,'2018_06_06_110524_add_parent_sell_line_id_column_to_transaction_sell_lines_table',1),(110,'2018_06_07_152443_add_is_service_staff_to_roles_table',1),(111,'2018_06_07_182258_add_image_field_to_products_table',1),(112,'2018_06_13_133705_create_bookings_table',1),(113,'2018_06_15_173636_add_email_column_to_contacts_table',1),(114,'2018_06_27_182835_add_superadmin_related_fields_business',1),(115,'2018_06_27_185405_create_packages_table',1),(116,'2018_06_28_182803_create_subscriptions_table',1),(117,'2018_07_10_101913_add_custom_fields_to_products_table',1),(118,'2018_07_17_103434_add_sales_person_name_label_to_invoice_layouts_table',1),(119,'2018_07_17_163920_add_theme_skin_color_column_to_business_table',1),(120,'2018_07_17_182021_add_rows_to_system_table',1),(121,'2018_07_19_131721_add_options_to_packages_table',1),(122,'2018_07_24_160319_add_lot_no_line_id_to_transaction_sell_lines_table',1),(123,'2018_07_25_110004_add_show_expiry_and_show_lot_colums_to_invoice_layouts_table',1),(124,'2018_07_25_172004_add_discount_columns_to_transaction_sell_lines_table',1),(125,'2018_07_26_124720_change_design_column_type_in_invoice_layouts_table',1),(126,'2018_07_26_170424_add_unit_price_before_discount_column_to_transaction_sell_line_table',1),(127,'2018_07_28_103614_add_credit_limit_column_to_contacts_table',1),(128,'2018_08_08_110755_add_new_payment_methods_to_transaction_payments_table',1),(129,'2018_08_08_122225_modify_cash_register_transactions_table_for_new_payment_methods',1),(130,'2018_08_14_104036_add_opening_balance_type_to_transactions_table',1),(131,'2018_08_17_155534_add_min_termination_alert_days',1),(132,'2018_08_28_105945_add_business_based_username_settings_to_system_table',1),(133,'2018_08_30_105906_add_superadmin_communicator_logs_table',1),(134,'2018_09_04_155900_create_accounts_table',1),(135,'2018_09_06_114438_create_selling_price_groups_table',1),(136,'2018_09_06_154057_create_variation_group_prices_table',1),(137,'2018_09_07_102413_add_permission_to_access_default_selling_price',1),(138,'2018_09_07_134858_add_selling_price_group_id_to_transactions_table',1),(139,'2018_09_10_112448_update_product_type_to_single_if_null_in_products_table',1),(140,'2018_09_10_152703_create_account_transactions_table',1),(141,'2018_09_10_173656_add_account_id_column_to_transaction_payments_table',1),(142,'2018_09_19_123914_create_notification_templates_table',1),(143,'2018_09_22_110504_add_sms_and_email_settings_columns_to_business_table',1),(144,'2018_09_24_134942_add_lot_no_line_id_to_stock_adjustment_lines_table',1),(145,'2018_09_26_105557_add_transaction_payments_for_existing_expenses',1),(146,'2018_09_27_111609_modify_transactions_table_for_purchase_return',1),(147,'2018_09_27_131154_add_quantity_returned_column_to_purchase_lines_table',1),(148,'2018_10_01_151252_create_documents_table',1),(149,'2018_10_02_131401_add_return_quantity_column_to_transaction_sell_lines_table',1),(150,'2018_10_02_151803_create_document_shares_table',1),(151,'2018_10_03_104918_add_qty_returned_column_to_transaction_sell_lines_purchase_lines_table',1),(152,'2018_10_03_185947_add_default_notification_templates_to_database',1),(153,'2018_10_09_134558_create_reminders_table',1),(154,'2018_10_09_153105_add_business_id_to_transaction_payments_table',1),(155,'2018_10_16_135229_create_permission_for_sells_and_purchase',1),(156,'2018_10_22_114441_add_columns_for_variable_product_modifications',1),(157,'2018_10_22_134428_modify_variable_product_data',1),(158,'2018_10_30_181558_add_table_tax_headings_to_invoice_layout',1),(159,'2018_10_31_122619_add_pay_terms_field_transactions_table',1),(160,'2018_10_31_161328_add_new_permissions_for_pos_screen',1),(161,'2018_10_31_174752_add_access_selected_contacts_only_to_users_table',1),(162,'2018_10_31_175627_add_user_contact_access',1),(163,'2018_10_31_180559_add_auto_send_sms_column_to_notification_templates_table',1),(164,'2018_11_02_130636_add_custom_permissions_to_packages_table',1),(165,'2018_11_02_171949_change_card_type_column_to_varchar_in_transaction_payments_table',1),(166,'2018_11_05_161848_add_more_fields_to_packages_table',1),(167,'2018_11_08_105621_add_role_permissions',1),(168,'2018_11_16_170756_create_to_dos_table',1),(169,'2018_11_26_114135_add_is_suspend_column_to_transactions_table',1),(170,'2018_11_28_104410_modify_units_table_for_multi_unit',1),(171,'2018_11_28_170952_add_sub_unit_id_to_purchase_lines_and_sell_lines',1),(172,'2018_11_29_115918_add_primary_key_in_system_table',1),(173,'2018_12_03_185546_add_product_description_column_to_products_table',1),(174,'2018_12_06_114937_modify_system_table_and_users_table',1),(175,'2018_12_10_124621_modify_system_table_values_null_default',1),(176,'2018_12_13_160007_add_custom_fields_display_options_to_invoice_layouts_table',1),(177,'2018_12_14_103307_modify_system_table',1),(178,'2018_12_18_133837_add_prev_balance_due_columns_to_invoice_layouts_table',1),(179,'2018_12_18_170656_add_invoice_token_column_to_transaction_table',1),(180,'2018_12_20_133639_add_date_time_format_column_to_invoice_layouts_table',1),(181,'2018_12_21_120659_add_recurring_invoice_fields_to_transactions_table',1),(182,'2018_12_24_154933_create_notifications_table',1),(183,'2019_01_08_112015_add_document_column_to_transaction_payments_table',1),(184,'2019_01_10_124645_add_account_permission',1),(185,'2019_01_16_125825_add_subscription_no_column_to_transactions_table',1),(186,'2019_01_28_111647_add_order_addresses_column_to_transactions_table',1),(187,'2019_02_13_173821_add_is_inactive_column_to_products_table',1),(188,'2019_02_19_103118_create_discounts_table',1),(189,'2019_02_21_120324_add_discount_id_column_to_transaction_sell_lines_table',1),(190,'2019_02_21_134324_add_permission_for_discount',1),(191,'2019_02_22_120329_essentials_messages',1),(192,'2019_02_22_161513_add_message_permissions',1),(193,'2019_03_04_170832_add_service_staff_columns_to_transaction_sell_lines_table',1),(194,'2019_03_07_155813_make_repair_statuses_table',1),(195,'2019_03_08_120634_add_repair_columns_to_transactions_table',1),(196,'2019_03_09_102425_add_sub_type_column_to_transactions_table',1),(197,'2019_03_09_124457_add_indexing_transaction_sell_lines_purchase_lines_table',1),(198,'2019_03_12_120336_create_activity_log_table',1),(199,'2019_03_14_182704_add_repair_permissions',1),(200,'2019_03_15_132925_create_media_table',1),(201,'2019_03_29_110241_add_repair_version_column_to_system_table',1),(202,'2019_03_29_164339_add_essentials_version_to_system_table',1),(203,'2019_04_12_113901_add_repair_settings_column_to_business_table',1),(204,'2019_05_08_130339_add_indexing_to_parent_id_in_transaction_payments_table',1),(205,'2019_05_10_132311_add_missing_column_indexing',1),(206,'2019_05_10_135434_add_missing_database_column_indexes',1),(207,'2019_05_14_091812_add_show_image_column_to_invoice_layouts_table',1),(208,'2019_05_17_153306_create_essentials_leave_types_table',1),(209,'2019_05_17_175921_create_essentials_leaves_table',1),(210,'2019_05_21_154517_add_essentials_settings_columns_to_business_table',1),(211,'2019_05_21_181653_create_table_essentials_attendance',1),(212,'2019_05_25_104922_add_view_purchase_price_permission',1),(213,'2019_05_30_110049_create_essentials_payrolls_table',1),(214,'2019_06_04_105723_create_essentials_holidays_table',1),(215,'2019_06_17_103515_add_profile_informations_columns_to_users_table',1),(216,'2019_06_18_135524_add_permission_to_view_own_sales_only',1),(217,'2019_06_19_112058_add_database_changes_for_reward_points',1),(218,'2019_06_28_133732_change_type_column_to_string_in_transactions_table',1),(219,'2019_06_28_134217_add_payroll_columns_to_transactions_table',1),(220,'2019_07_13_111420_add_is_created_from_api_column_to_transactions_table',1),(221,'2019_07_15_165136_add_fields_for_combo_product',1),(222,'2019_07_19_103446_add_mfg_quantity_used_column_to_purchase_lines_table',1),(223,'2019_07_22_152649_add_not_for_selling_in_product_table',1),(224,'2019_07_29_185351_add_show_reward_point_column_to_invoice_layouts_table',1),(225,'2019_08_08_162302_add_sub_units_related_fields',1),(226,'2019_08_16_115300_create_superadmin_frontend_pages_table',1),(227,'2019_08_26_103520_add_approve_leave_permission',1),(228,'2019_08_26_133419_update_price_fields_decimal_point',1),(229,'2019_08_27_103724_create_essentials_allowance_and_deduction_table',1),(230,'2019_08_27_105236_create_essentials_user_allowances_and_deductions',1),(231,'2019_09_02_160054_remove_location_permissions_from_roles',1),(232,'2019_09_03_185259_add_permission_for_pos_screen',1),(233,'2019_09_04_163141_add_location_id_to_cash_registers_table',1),(234,'2019_09_04_184008_create_types_of_services_table',1),(235,'2019_09_06_131445_add_types_of_service_fields_to_transactions_table',1),(236,'2019_09_09_134810_add_default_selling_price_group_id_column_to_business_locations_table',1),(237,'2019_09_12_105616_create_product_locations_table',1),(238,'2019_09_17_122522_add_custom_labels_column_to_business_table',1),(239,'2019_09_18_164319_add_shipping_fields_to_transactions_table',1),(240,'2019_09_19_170927_close_all_active_registers',1),(241,'2019_09_20_115906_add_more_columns_to_essentials_to_dos_table',1),(242,'2019_09_23_120439_create_essentials_todo_comments_table',1),(243,'2019_09_23_161906_add_media_description_cloumn_to_media_table',1),(244,'2019_10_18_155633_create_account_types_table',1),(245,'2019_10_22_163335_add_common_settings_column_to_business_table',1),(246,'2019_10_29_132521_add_update_purchase_status_permission',1),(247,'2019_11_09_110522_add_indexing_to_lot_number',1),(248,'2019_11_12_163135_create_projects_table',1),(249,'2019_11_12_164431_create_project_members_table',1),(250,'2019_11_14_112230_create_project_tasks_table',1),(251,'2019_11_14_112258_create_project_task_members_table',1),(252,'2019_11_18_154617_create_project_task_comments_table',1),(253,'2019_11_19_134807_create_project_time_logs_table',1),(254,'2019_11_19_170824_add_is_active_column_to_business_locations_table',1),(255,'2019_11_21_162913_change_quantity_field_types_to_decimal',1),(256,'2019_11_25_160340_modify_categories_table_for_polymerphic_relationship',1),(257,'2019_12_02_105025_create_warranties_table',1),(258,'2019_12_03_180342_add_common_settings_field_to_invoice_layouts_table',1),(259,'2019_12_05_170724_add_hrm_columns_to_users_table',1),(260,'2019_12_05_183955_add_more_fields_to_users_table',1),(261,'2019_12_06_174904_add_change_return_label_column_to_invoice_layouts_table',1),(262,'2019_12_09_105809_add_allowance_and_deductions_permission',1),(263,'2019_12_11_102549_add_more_fields_in_transactions_table',1),(264,'2019_12_11_102735_create_invoice_lines_table',1),(265,'2019_12_11_121307_add_draft_and_quotation_list_permissions',1),(266,'2019_12_12_180126_copy_expense_total_to_total_before_tax',1),(267,'2019_12_19_181412_make_alert_quantity_field_nullable_on_products_table',1),(268,'2019_12_25_173413_create_dashboard_configurations_table',1),(269,'2020_01_07_172852_add_project_permissions',1),(270,'2020_01_08_115422_add_project_module_version_to_system_table',1),(271,'2020_01_08_133506_create_document_and_notes_table',1),(272,'2020_01_09_113252_add_cc_bcc_column_to_notification_templates_table',1),(273,'2020_01_16_174818_add_round_off_amount_field_to_transactions_table',1),(274,'2020_01_28_162345_add_weighing_scale_settings_in_business_settings_table',1),(275,'2020_02_18_172447_add_import_fields_to_transactions_table',1),(276,'2020_03_13_135844_add_is_active_column_to_selling_price_groups_table',1),(277,'2020_03_16_115449_add_contact_status_field_to_contacts_table',1),(278,'2020_03_26_124736_add_allow_login_column_in_users_table',1),(279,'2020_03_28_152838_create_essentials_shift_table',1),(280,'2020_03_30_162029_create_user_shifts_table',1),(281,'2020_03_31_134558_add_shift_id_to_attendance_table',1),(282,'2020_04_13_154150_add_feature_products_column_to_business_loactions',1),(283,'2020_04_15_151802_add_user_type_to_users_table',1),(284,'2020_04_22_153905_add_subscription_repeat_on_column_to_transactions_table',1),(285,'2020_04_28_111436_add_shipping_address_to_contacts_table',1),(286,'2020_05_05_125008_create_device_models_table',1),(287,'2020_05_06_103135_add_repair_model_id_column_to_products_table',1),(288,'2020_06_01_094654_add_max_sale_discount_column_to_users_table',1),(289,'2020_06_12_162245_modify_contacts_table',1),(290,'2020_06_22_103104_change_recur_interval_default_to_one',1),(291,'2020_07_09_174621_add_balance_field_to_contacts_table',1),(292,'2020_07_10_114514_set_location_id_on_existing_invoice',1),(293,'2020_07_11_120308_add_columns_to_repair_statuses_table',1),(294,'2020_07_23_104933_change_status_column_to_varchar_in_transaction_table',1),(295,'2020_07_31_130737_create_job_sheets_table',1),(296,'2020_08_07_124241_add_job_sheet_id_to_transactions_table',1),(297,'2020_08_18_123107_add_connector_module_version_to_system_table',1),(298,'2020_08_19_175842_add_asset_management_module_version_to_system_table',1),(299,'2020_08_20_114339_create_assets_table',1),(300,'2020_08_20_173031_create_asset_transactions_table',1),(301,'2020_08_21_180138_add_asset_settings_column_to_business_table',1),(302,'2020_08_22_104640_add_email_template_field_to_repair_status_table',1),(303,'2020_09_07_171059_change_completed_stock_transfer_status_to_final',1),(304,'2020_09_21_123224_modify_booking_status_column_in_bookings_table',1),(305,'2020_09_22_121639_create_discount_variations_table',1),(306,'2020_09_29_184909_add_product_catalogue_version',1),(307,'2020_10_05_121550_modify_business_location_table_for_invoice_layout',1),(308,'2020_10_16_175726_set_status_as_received_for_opening_stock',1),(309,'2020_10_19_131934_add_job_sheet_custom_fields_to_repair_job_sheets_table',1),(310,'2020_10_23_170823_add_for_group_tax_column_to_tax_rates_table',1),(311,'2020_11_04_130940_add_more_custom_fields_to_contacts_table',1),(312,'2020_11_05_105157_modify_todos_date_column_type',1),(313,'2020_11_10_152841_add_cash_register_permissions',1),(314,'2020_11_11_174852_add_end_time_column_to_essentials_reminders_table',1),(315,'2020_11_17_164041_modify_type_column_to_varchar_in_contacts_table',1),(316,'2020_11_25_111050_add_parts_column_to_repair_job_sheets_table',1),(317,'2020_11_26_170527_create_essentials_kb_table',1),(318,'2020_11_30_112615_create_essentials_kb_users_table',1),(319,'2020_12_18_181447_add_shipping_custom_fields_to_transactions_table',1),(320,'2020_12_22_164303_add_sub_status_column_to_transactions_table',1),(321,'2020_12_23_125610_add_spreadsheet_version_to_system_table',1),(322,'2020_12_23_153255_create_spreadsheets_table',1),(323,'2020_12_24_153050_add_custom_fields_to_transactions_table',1),(324,'2020_12_28_105403_add_whatsapp_text_column_to_notification_templates_table',1),(325,'2020_12_29_165925_add_model_document_type_to_media_table',1),(326,'2020_12_30_101842_add_use_for_repair_column_to_brands_table',1),(327,'2021_02_08_175632_add_contact_number_fields_to_users_table',1),(328,'2021_02_11_172217_add_indexing_for_multiple_columns',1),(329,'2021_02_12_185514_add_clock_in_location_to_essentials_attendances_table',1),(330,'2021_02_16_190203_add_essentials_module_indexing',1),(331,'2021_02_16_190423_add_repair_module_indexing',1),(332,'2021_02_23_122043_add_more_columns_to_customer_groups_table',1),(333,'2021_02_24_175551_add_print_invoice_permission_to_all_roles',1),(334,'2021_02_27_133448_add_columns_to_users_table',1),(335,'2021_03_03_162021_add_purchase_order_columns_to_purchase_lines_and_transactions_table',1),(336,'2021_03_04_174857_create_payroll_groups_table',1),(337,'2021_03_04_175025_create_payroll_group_transactions_table',1),(338,'2021_03_09_123914_add_auto_clockout_to_essentials_shifts',1),(339,'2021_03_11_120229_add_sales_order_columns',1),(340,'2021_03_12_175416_create_spreadsheet_shares_table',1),(341,'2021_03_16_120705_add_business_id_to_activity_log_table',1),(342,'2021_03_16_153427_add_code_columns_to_business_table',1),(343,'2021_03_18_173308_add_account_details_column_to_accounts_table',1),(344,'2021_03_18_183119_add_prefer_payment_account_columns_to_transactions_table',1),(345,'2021_03_22_120810_add_more_types_of_service_custom_fields',1),(346,'2021_03_24_183132_add_shipping_export_custom_field_details_to_contacts_table',1),(347,'2021_03_25_170715_add_export_custom_fields_info_to_transactions_table',1),(348,'2021_04_15_063449_add_denominations_column_to_cash_registers_table',1),(349,'2021_05_22_083426_add_indexing_to_account_transactions_table',1),(350,'2021_06_17_121451_add_location_id_to_table',1),(351,'2021_07_08_065808_add_additional_expense_columns_to_transaction_table',1),(352,'2021_07_13_082918_add_qr_code_columns_to_invoice_layouts_table',1),(353,'2021_07_21_061615_add_fields_to_show_commission_agent_in_invoice_layout',1),(354,'2021_08_13_105549_add_crm_contact_id_to_users_table',1),(355,'2021_08_25_114932_add_payment_link_fields_to_transaction_payments_table',1),(356,'2021_09_01_063110_add_spg_column_to_discounts_table',1),(357,'2021_09_03_061528_modify_cash_register_transactions_table',1),(358,'2021_09_28_091541_create_essentials_user_sales_targets_table',1),(359,'2021_10_05_061658_add_source_column_to_transactions_table',1),(360,'2021_10_29_110841_create_asset_warranties_table',1),(361,'2021_12_16_121851_add_parent_id_column_to_expense_categories_table',1),(362,'2022_03_26_062215_create_asset_maintenances_table',1),(363,'2022_04_14_075120_add_payment_type_column_to_transaction_payments_table',1),(364,'2022_04_21_083327_create_cash_denominations_table',1),(365,'2022_05_10_055307_add_delivery_date_column_to_transactions_table',1),(366,'2022_05_11_070711_add_maintenance_note_column_to_asset_maintenances_table',1),(367,'2022_06_13_123135_add_currency_precision_and_quantity_precision_fields_to_business_table',1),(368,'2022_06_28_133342_add_secondary_unit_columns_to_products_sell_line_purchase_lines_tables',1),(369,'2022_07_13_114307_create_purchase_requisition_related_columns',1),(370,'2022_08_04_143146_create_cms_pages_table',1),(371,'2022_08_25_132707_add_service_staff_timer_fields_to_products_and_users_table',1),(372,'2022_09_10_161849_add_layout_column_to_cms_pages_table',1),(373,'2022_09_10_163209_create_cms_site_details_table',1),(374,'2022_09_15_122547_create_cms_page_metas_table',1),(375,'2022_09_16_130337_create_default_data_for_cms',1),(376,'2022_10_31_115725_create_accounting_account_types_table',1),(377,'2022_11_01_104108_create_accounting_accounts_table',1),(378,'2022_11_10_135427_create_accounts_transactions_table',1),(379,'2022_11_14_171948_create_accounting_acc_trans_mapping',1),(380,'2022_12_02_133536_create_accounting_budgets_table',1),(381,'2022_12_19_124743_add_accounting_settings_column_to_business_table',1),(382,'2022_12_23_162847_add_repair_jobsheet_settings_column_to_business_table',1),(383,'2023_01_16_124948_add_folder_id_column_to_sheet_spreadsheets_table',1),(384,'2023_01_28_114255_add_letter_head_column_to_invoice_layouts_table',1),(385,'2023_02_11_161510_add_event_column_to_activity_log_table',1),(386,'2023_02_11_161511_add_batch_uuid_column_to_activity_log_table',1),(387,'2023_02_17_140135_AddVersionForAiAssistance',1),(388,'2023_02_21_182321_create_aiassistance_generation_table',1),(389,'2023_03_02_170312_add_provider_to_oauth_clients_table',1),(390,'2022_12_26_182821_AddAccountingModuleVersionToSystemTable',2),(391,'2023_05_25_131005_add_default_map_transactions_fields',2),(392,'2019_07_15_114211_add_manufacturing_module_version_to_system_table',3),(393,'2019_07_15_114403_create_mfg_recipes_table',3),(394,'2019_07_18_180217_add_production_columns_to_transactions_table',3),(395,'2019_07_26_110753_add_manufacturing_settings_column_to_business_table',3),(396,'2019_07_26_170450_add_manufacturing_permissions',3),(397,'2019_08_08_110035_create_mfg_recipe_ingredients_table',3),(398,'2019_08_08_172837_add_recipe_add_edit_permissions',3),(399,'2019_08_12_114610_add_ingredient_waste_percent_columns',3),(400,'2019_11_05_115136_create_ingredient_groups_table',3),(401,'2020_02_22_120303_add_column_to_mfg_recipe_ingredients_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\User',1);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_templates`
--

DROP TABLE IF EXISTS `notification_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `template_for` varchar(191) NOT NULL,
  `email_body` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `whatsapp_text` text DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `cc` varchar(191) DEFAULT NULL,
  `bcc` varchar(191) DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT 0,
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT 0,
  `auto_send_wa_notif` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_templates`
--

LOCK TABLES `notification_templates` WRITE;
/*!40000 ALTER TABLE `notification_templates` DISABLE KEYS */;
INSERT INTO `notification_templates` VALUES (1,1,'new_sale','<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>','Dear {contact_name}, Thank you for shopping with us. {business_name}',NULL,'Thank you from {business_name}',NULL,NULL,0,0,0,'2023-08-28 17:44:13','2023-08-28 17:44:13'),(2,1,'payment_received','<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>','Dear {contact_name}, We have received a payment of {received_amount}. {business_name}',NULL,'Payment Received, from {business_name}',NULL,NULL,0,0,0,'2023-08-28 17:44:13','2023-08-28 17:44:13'),(3,1,'payment_reminder','<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>','Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}',NULL,'Payment Reminder, from {business_name}',NULL,NULL,0,0,0,'2023-08-28 17:44:13','2023-08-28 17:44:13'),(4,1,'new_booking','<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>','Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}',NULL,'Booking Confirmed - {business_name}',NULL,NULL,0,0,0,'2023-08-28 17:44:13','2023-08-28 17:44:13'),(5,1,'new_order','<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}',NULL,'New Order, from {business_name}',NULL,NULL,0,0,0,'2023-08-28 17:44:13','2023-08-28 17:44:13'),(6,1,'payment_paid','<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}',NULL,'Payment Paid, from {business_name}',NULL,NULL,0,0,0,'2023-08-28 17:44:13','2023-08-28 17:44:13'),(7,1,'items_received','<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}',NULL,'Items received, from {business_name}',NULL,NULL,0,0,0,'2023-08-28 17:44:13','2023-08-28 17:44:13'),(8,1,'items_pending','<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}',NULL,'Items Pending, from {business_name}',NULL,NULL,0,0,0,'2023-08-28 17:44:13','2023-08-28 17:44:13'),(9,1,'new_quotation','<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>','Dear {contact_name}, Thank you for shopping with us. {business_name}',NULL,'Thank you from {business_name}',NULL,NULL,0,0,0,'2023-08-28 17:44:13','2023-08-28 17:44:13'),(10,1,'purchase_order','<p>Dear {contact_name},</p>\n\n                    <p>We have a new purchase order with reference number {order_ref_number}. The respective invoice is attached here with.</p>\n\n                    <p>{business_logo}</p>','We have a new purchase order with reference number {order_ref_number}. {business_name}',NULL,'New Purchase Order, from {business_name}',NULL,NULL,0,0,0,'2023-08-28 17:44:13','2023-08-28 17:44:13');
/*!40000 ALTER TABLE `notification_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `location_count` int(11) NOT NULL COMMENT 'No. of Business Locations, 0 = infinite option.',
  `user_count` int(11) NOT NULL,
  `product_count` int(11) NOT NULL,
  `bookings` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable/Disable bookings',
  `kitchen` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable/Disable kitchen',
  `order_screen` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable/Disable order_screen',
  `tables` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable/Disable tables',
  `invoice_count` int(11) NOT NULL,
  `interval` enum('days','months','years') NOT NULL,
  `interval_count` int(11) NOT NULL,
  `trial_days` int(11) NOT NULL,
  `price` decimal(22,4) NOT NULL,
  `custom_permissions` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `is_one_time` tinyint(1) NOT NULL DEFAULT 0,
  `enable_custom_link` tinyint(1) NOT NULL DEFAULT 0,
  `custom_link` varchar(191) DEFAULT NULL,
  `custom_link_text` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (1,'ADMIN','ADMIN',0,0,0,0,0,0,0,0,'years',90,10,0.0000,'{\"accounting_module\":\"1\",\"aiassistance_module\":\"1\",\"aiassistance_max_token\":null,\"assetmanagement_module\":\"1\",\"connector_module\":\"1\",\"essentials_module\":\"1\",\"productcatalogue_module\":\"1\",\"project_module\":\"1\",\"repair_module\":\"1\",\"spreadsheet_module\":\"1\"}',1,1,1,1,1,1,NULL,NULL,NULL,'2023-08-28 17:49:17','2023-08-28 17:56:47');
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'profit_loss_report.view','web','2023-08-28 17:41:27',NULL),(2,'direct_sell.access','web','2023-08-28 17:41:27',NULL),(3,'product.opening_stock','web','2023-08-28 17:41:28','2023-08-28 17:41:28'),(4,'crud_all_bookings','web','2023-08-28 17:41:28','2023-08-28 17:41:28'),(5,'crud_own_bookings','web','2023-08-28 17:41:28','2023-08-28 17:41:28'),(6,'access_default_selling_price','web','2023-08-28 17:41:29','2023-08-28 17:41:29'),(7,'purchase.payments','web','2023-08-28 17:41:29','2023-08-28 17:41:29'),(8,'sell.payments','web','2023-08-28 17:41:29','2023-08-28 17:41:29'),(9,'edit_product_price_from_sale_screen','web','2023-08-28 17:41:29','2023-08-28 17:41:29'),(10,'edit_product_discount_from_sale_screen','web','2023-08-28 17:41:29','2023-08-28 17:41:29'),(11,'roles.view','web','2023-08-28 17:41:29','2023-08-28 17:41:29'),(12,'roles.create','web','2023-08-28 17:41:29','2023-08-28 17:41:29'),(13,'roles.update','web','2023-08-28 17:41:29','2023-08-28 17:41:29'),(14,'roles.delete','web','2023-08-28 17:41:29','2023-08-28 17:41:29'),(15,'account.access','web','2023-08-28 17:41:29','2023-08-28 17:41:29'),(16,'discount.access','web','2023-08-28 17:41:29','2023-08-28 17:41:29'),(17,'essentials.create_message','web','2023-08-28 17:41:29','2023-08-28 17:41:29'),(18,'essentials.view_message','web','2023-08-28 17:41:29','2023-08-28 17:41:29'),(19,'repair.create','web','2023-08-28 17:41:30','2023-08-28 17:41:30'),(20,'repair.update','web','2023-08-28 17:41:30','2023-08-28 17:41:30'),(21,'repair.view','web','2023-08-28 17:41:30','2023-08-28 17:41:30'),(22,'repair.delete','web','2023-08-28 17:41:30','2023-08-28 17:41:30'),(23,'repair_status.update','web','2023-08-28 17:41:30','2023-08-28 17:41:30'),(24,'repair_status.access','web','2023-08-28 17:41:30','2023-08-28 17:41:30'),(25,'view_purchase_price','web','2023-08-28 17:41:30','2023-08-28 17:41:30'),(26,'view_own_sell_only','web','2023-08-28 17:41:30','2023-08-28 17:41:30'),(27,'essentials.approve_leave','web','2023-08-28 17:41:30','2023-08-28 17:41:30'),(28,'edit_product_discount_from_pos_screen','web','2023-08-28 17:41:31','2023-08-28 17:41:31'),(29,'edit_product_price_from_pos_screen','web','2023-08-28 17:41:31','2023-08-28 17:41:31'),(30,'access_shipping','web','2023-08-28 17:41:31','2023-08-28 17:41:31'),(31,'essentials.assign_todos','web','2023-08-28 17:41:31','2023-08-28 17:41:31'),(32,'purchase.update_status','web','2023-08-28 17:41:31','2023-08-28 17:41:31'),(33,'essentials.add_allowance_and_deduction','web','2023-08-28 17:41:31','2023-08-28 17:41:31'),(34,'list_drafts','web','2023-08-28 17:41:32','2023-08-28 17:41:32'),(35,'list_quotations','web','2023-08-28 17:41:32','2023-08-28 17:41:32'),(36,'project.create_project','web','2023-08-28 17:41:32','2023-08-28 17:41:32'),(37,'project.edit_project','web','2023-08-28 17:41:32','2023-08-28 17:41:32'),(38,'project.delete_project','web','2023-08-28 17:41:32','2023-08-28 17:41:32'),(39,'view_cash_register','web','2023-08-28 17:41:33','2023-08-28 17:41:33'),(40,'close_cash_register','web','2023-08-28 17:41:33','2023-08-28 17:41:33'),(41,'print_invoice','web','2023-08-28 17:41:34','2023-08-28 17:41:34'),(42,'user.view','web','2023-08-28 17:42:28',NULL),(43,'user.create','web','2023-08-28 17:42:28',NULL),(44,'user.update','web','2023-08-28 17:42:28',NULL),(45,'user.delete','web','2023-08-28 17:42:28',NULL),(46,'supplier.view','web','2023-08-28 17:42:28',NULL),(47,'supplier.create','web','2023-08-28 17:42:28',NULL),(48,'supplier.update','web','2023-08-28 17:42:28',NULL),(49,'supplier.delete','web','2023-08-28 17:42:28',NULL),(50,'customer.view','web','2023-08-28 17:42:28',NULL),(51,'customer.create','web','2023-08-28 17:42:28',NULL),(52,'customer.update','web','2023-08-28 17:42:28',NULL),(53,'customer.delete','web','2023-08-28 17:42:28',NULL),(54,'product.view','web','2023-08-28 17:42:28',NULL),(55,'product.create','web','2023-08-28 17:42:28',NULL),(56,'product.update','web','2023-08-28 17:42:28',NULL),(57,'product.delete','web','2023-08-28 17:42:28',NULL),(58,'purchase.view','web','2023-08-28 17:42:28',NULL),(59,'purchase.create','web','2023-08-28 17:42:28',NULL),(60,'purchase.update','web','2023-08-28 17:42:28',NULL),(61,'purchase.delete','web','2023-08-28 17:42:28',NULL),(62,'sell.view','web','2023-08-28 17:42:28',NULL),(63,'sell.create','web','2023-08-28 17:42:28',NULL),(64,'sell.update','web','2023-08-28 17:42:28',NULL),(65,'sell.delete','web','2023-08-28 17:42:28',NULL),(66,'purchase_n_sell_report.view','web','2023-08-28 17:42:28',NULL),(67,'contacts_report.view','web','2023-08-28 17:42:28',NULL),(68,'stock_report.view','web','2023-08-28 17:42:28',NULL),(69,'tax_report.view','web','2023-08-28 17:42:28',NULL),(70,'trending_product_report.view','web','2023-08-28 17:42:28',NULL),(71,'register_report.view','web','2023-08-28 17:42:28',NULL),(72,'sales_representative.view','web','2023-08-28 17:42:28',NULL),(73,'expense_report.view','web','2023-08-28 17:42:28',NULL),(74,'business_settings.access','web','2023-08-28 17:42:28',NULL),(75,'barcode_settings.access','web','2023-08-28 17:42:28',NULL),(76,'invoice_settings.access','web','2023-08-28 17:42:28',NULL),(77,'brand.view','web','2023-08-28 17:42:28',NULL),(78,'brand.create','web','2023-08-28 17:42:28',NULL),(79,'brand.update','web','2023-08-28 17:42:28',NULL),(80,'brand.delete','web','2023-08-28 17:42:28',NULL),(81,'tax_rate.view','web','2023-08-28 17:42:28',NULL),(82,'tax_rate.create','web','2023-08-28 17:42:28',NULL),(83,'tax_rate.update','web','2023-08-28 17:42:28',NULL),(84,'tax_rate.delete','web','2023-08-28 17:42:28',NULL),(85,'unit.view','web','2023-08-28 17:42:28',NULL),(86,'unit.create','web','2023-08-28 17:42:28',NULL),(87,'unit.update','web','2023-08-28 17:42:28',NULL),(88,'unit.delete','web','2023-08-28 17:42:28',NULL),(89,'category.view','web','2023-08-28 17:42:28',NULL),(90,'category.create','web','2023-08-28 17:42:28',NULL),(91,'category.update','web','2023-08-28 17:42:28',NULL),(92,'category.delete','web','2023-08-28 17:42:28',NULL),(93,'expense.access','web','2023-08-28 17:42:28',NULL),(94,'access_all_locations','web','2023-08-28 17:42:28',NULL),(95,'dashboard.data','web','2023-08-28 17:42:28',NULL),(96,'location.1','web','2023-08-28 17:44:13','2023-08-28 17:44:13'),(97,'manufacturing.access_recipe','web','2023-08-29 06:12:59','2023-08-29 06:12:59'),(98,'manufacturing.access_production','web','2023-08-29 06:12:59','2023-08-29 06:12:59'),(99,'manufacturing.add_recipe','web','2023-08-29 06:12:59','2023-08-29 06:12:59'),(100,'manufacturing.edit_recipe','web','2023-08-29 06:12:59','2023-08-29 06:12:59');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pjt_invoice_lines`
--

DROP TABLE IF EXISTS `pjt_invoice_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pjt_invoice_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL,
  `task` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `rate` decimal(22,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `total` decimal(22,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pjt_invoice_lines_transaction_id_foreign` (`transaction_id`),
  KEY `pjt_invoice_lines_tax_rate_id_index` (`tax_rate_id`),
  CONSTRAINT `pjt_invoice_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pjt_invoice_lines`
--

LOCK TABLES `pjt_invoice_lines` WRITE;
/*!40000 ALTER TABLE `pjt_invoice_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `pjt_invoice_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pjt_project_members`
--

DROP TABLE IF EXISTS `pjt_project_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pjt_project_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pjt_project_members_project_id_foreign` (`project_id`),
  KEY `pjt_project_members_user_id_index` (`user_id`),
  CONSTRAINT `pjt_project_members_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `pjt_projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pjt_project_members`
--

LOCK TABLES `pjt_project_members` WRITE;
/*!40000 ALTER TABLE `pjt_project_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `pjt_project_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pjt_project_task_comments`
--

DROP TABLE IF EXISTS `pjt_project_task_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pjt_project_task_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_task_id` int(10) unsigned NOT NULL,
  `comment` text NOT NULL,
  `commented_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pjt_project_task_comments_project_task_id_foreign` (`project_task_id`),
  CONSTRAINT `pjt_project_task_comments_project_task_id_foreign` FOREIGN KEY (`project_task_id`) REFERENCES `pjt_project_tasks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pjt_project_task_comments`
--

LOCK TABLES `pjt_project_task_comments` WRITE;
/*!40000 ALTER TABLE `pjt_project_task_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `pjt_project_task_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pjt_project_task_members`
--

DROP TABLE IF EXISTS `pjt_project_task_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pjt_project_task_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_task_id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pjt_project_task_members_project_task_id_foreign` (`project_task_id`),
  KEY `pjt_project_task_members_user_id_index` (`user_id`),
  CONSTRAINT `pjt_project_task_members_project_task_id_foreign` FOREIGN KEY (`project_task_id`) REFERENCES `pjt_project_tasks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pjt_project_task_members`
--

LOCK TABLES `pjt_project_task_members` WRITE;
/*!40000 ALTER TABLE `pjt_project_task_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `pjt_project_task_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pjt_project_tasks`
--

DROP TABLE IF EXISTS `pjt_project_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pjt_project_tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `task_id` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `priority` enum('low','medium','high','urgent') NOT NULL DEFAULT 'low',
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `status` enum('completed','not_started','in_progress','on_hold','cancelled') NOT NULL DEFAULT 'not_started',
  `custom_field_1` varchar(191) DEFAULT NULL,
  `custom_field_2` varchar(191) DEFAULT NULL,
  `custom_field_3` varchar(191) DEFAULT NULL,
  `custom_field_4` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pjt_project_tasks_project_id_foreign` (`project_id`),
  KEY `pjt_project_tasks_business_id_index` (`business_id`),
  KEY `pjt_project_tasks_created_by_index` (`created_by`),
  CONSTRAINT `pjt_project_tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `pjt_projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pjt_project_tasks`
--

LOCK TABLES `pjt_project_tasks` WRITE;
/*!40000 ALTER TABLE `pjt_project_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `pjt_project_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pjt_project_time_logs`
--

DROP TABLE IF EXISTS `pjt_project_time_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pjt_project_time_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL,
  `project_task_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL,
  `note` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pjt_project_time_logs_project_id_foreign` (`project_id`),
  KEY `pjt_project_time_logs_project_task_id_foreign` (`project_task_id`),
  KEY `pjt_project_time_logs_user_id_index` (`user_id`),
  KEY `pjt_project_time_logs_created_by_index` (`created_by`),
  CONSTRAINT `pjt_project_time_logs_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `pjt_projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pjt_project_time_logs_project_task_id_foreign` FOREIGN KEY (`project_task_id`) REFERENCES `pjt_project_tasks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pjt_project_time_logs`
--

LOCK TABLES `pjt_project_time_logs` WRITE;
/*!40000 ALTER TABLE `pjt_project_time_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pjt_project_time_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pjt_projects`
--

DROP TABLE IF EXISTS `pjt_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pjt_projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `status` enum('not_started','in_progress','on_hold','cancelled','completed') NOT NULL,
  `lead_id` int(11) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `settings` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pjt_projects_business_id_index` (`business_id`),
  KEY `pjt_projects_contact_id_index` (`contact_id`),
  KEY `pjt_projects_lead_id_index` (`lead_id`),
  KEY `pjt_projects_created_by_index` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pjt_projects`
--

LOCK TABLES `pjt_projects` WRITE;
/*!40000 ALTER TABLE `pjt_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `pjt_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printers`
--

DROP TABLE IF EXISTS `printers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `printers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `connection_type` enum('network','windows','linux') NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) DEFAULT NULL,
  `ip_address` varchar(191) DEFAULT NULL,
  `port` varchar(191) DEFAULT NULL,
  `path` varchar(191) DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `printers_business_id_foreign` (`business_id`),
  CONSTRAINT `printers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printers`
--

LOCK TABLES `printers` WRITE;
/*!40000 ALTER TABLE `printers` DISABLE KEYS */;
/*!40000 ALTER TABLE `printers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_locations`
--

DROP TABLE IF EXISTS `product_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_locations` (
  `product_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  KEY `product_locations_product_id_index` (`product_id`),
  KEY `product_locations_location_id_index` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_locations`
--

LOCK TABLES `product_locations` WRITE;
/*!40000 ALTER TABLE `product_locations` DISABLE KEYS */;
INSERT INTO `product_locations` VALUES (1,1);
/*!40000 ALTER TABLE `product_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_racks`
--

DROP TABLE IF EXISTS `product_racks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_racks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `rack` varchar(191) DEFAULT NULL,
  `row` varchar(191) DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_racks_business_id_index` (`business_id`),
  KEY `product_racks_location_id_index` (`location_id`),
  KEY `product_racks_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_racks`
--

LOCK TABLES `product_racks` WRITE;
/*!40000 ALTER TABLE `product_racks` DISABLE KEYS */;
INSERT INTO `product_racks` VALUES (1,1,1,1,NULL,NULL,NULL,'2023-08-28 18:21:19','2023-08-28 18:21:19');
/*!40000 ALTER TABLE `product_racks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variations`
--

DROP TABLE IF EXISTS `product_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_variations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `variation_template_id` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_variations_name_index` (`name`),
  KEY `product_variations_product_id_index` (`product_id`),
  CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variations`
--

LOCK TABLES `product_variations` WRITE;
/*!40000 ALTER TABLE `product_variations` DISABLE KEYS */;
INSERT INTO `product_variations` VALUES (1,NULL,'DUMMY',1,1,'2023-08-28 18:21:19','2023-08-28 18:21:19');
/*!40000 ALTER TABLE `product_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) unsigned NOT NULL,
  `type` enum('single','variable','modifier','combo') DEFAULT NULL,
  `unit_id` int(11) unsigned DEFAULT NULL,
  `secondary_unit_id` int(11) DEFAULT NULL,
  `sub_unit_ids` text DEFAULT NULL,
  `brand_id` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `sub_category_id` int(10) unsigned DEFAULT NULL,
  `tax` int(10) unsigned DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT 0,
  `alert_quantity` decimal(22,4) DEFAULT NULL,
  `sku` varchar(191) NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT 0,
  `weight` varchar(191) DEFAULT NULL,
  `product_custom_field1` varchar(191) DEFAULT NULL,
  `product_custom_field2` varchar(191) DEFAULT NULL,
  `product_custom_field3` varchar(191) DEFAULT NULL,
  `product_custom_field4` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `product_description` text DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `preparation_time_in_minutes` int(11) DEFAULT NULL,
  `warranty_id` int(11) DEFAULT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT 0,
  `repair_model_id` int(10) unsigned DEFAULT NULL,
  `not_for_selling` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_brand_id_foreign` (`brand_id`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_sub_category_id_foreign` (`sub_category_id`),
  KEY `products_tax_foreign` (`tax`),
  KEY `products_name_index` (`name`),
  KEY `products_business_id_index` (`business_id`),
  KEY `products_unit_id_index` (`unit_id`),
  KEY `products_created_by_index` (`created_by`),
  KEY `products_warranty_id_index` (`warranty_id`),
  KEY `products_type_index` (`type`),
  KEY `products_tax_type_index` (`tax_type`),
  KEY `products_barcode_type_index` (`barcode_type`),
  KEY `products_repair_model_id_index` (`repair_model_id`),
  KEY `products_secondary_unit_id_index` (`secondary_unit_id`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_repair_model_id_foreign` FOREIGN KEY (`repair_model_id`) REFERENCES `repair_device_models` (`id`),
  CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_tax_foreign` FOREIGN KEY (`tax`) REFERENCES `tax_rates` (`id`),
  CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Test Product 1',1,'single',1,NULL,NULL,NULL,NULL,NULL,NULL,'exclusive',0,0.0000,'0001','C128',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,0,NULL,0,'2023-08-28 18:21:19','2023-08-28 18:21:19');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_lines`
--

DROP TABLE IF EXISTS `purchase_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `variation_id` int(10) unsigned NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `secondary_unit_quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `pp_without_discount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'Inline discount percentage',
  `purchase_price` decimal(22,4) NOT NULL,
  `purchase_price_inc_tax` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) unsigned DEFAULT NULL,
  `purchase_requisition_line_id` int(11) DEFAULT NULL,
  `purchase_order_line_id` int(11) DEFAULT NULL,
  `quantity_sold` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Quanity sold from this purchase line',
  `quantity_adjusted` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Quanity adjusted in stock adjustment from this purchase line',
  `quantity_returned` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `po_quantity_purchased` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_quantity_used` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(191) DEFAULT NULL,
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_lines_transaction_id_foreign` (`transaction_id`),
  KEY `purchase_lines_product_id_foreign` (`product_id`),
  KEY `purchase_lines_variation_id_foreign` (`variation_id`),
  KEY `purchase_lines_tax_id_foreign` (`tax_id`),
  KEY `purchase_lines_sub_unit_id_index` (`sub_unit_id`),
  KEY `purchase_lines_lot_number_index` (`lot_number`),
  CONSTRAINT `purchase_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_lines`
--

LOCK TABLES `purchase_lines` WRITE;
/*!40000 ALTER TABLE `purchase_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reference_counts`
--

DROP TABLE IF EXISTS `reference_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_counts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ref_type` varchar(191) NOT NULL,
  `ref_count` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reference_counts_business_id_index` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference_counts`
--

LOCK TABLES `reference_counts` WRITE;
/*!40000 ALTER TABLE `reference_counts` DISABLE KEYS */;
INSERT INTO `reference_counts` VALUES (1,'contacts',1,1,'2023-08-28 17:44:13','2023-08-28 17:44:13'),(2,'business_location',1,1,'2023-08-28 17:44:13','2023-08-28 17:44:13'),(3,'sell_payment',1,1,'2023-08-28 18:21:42','2023-08-28 18:21:42');
/*!40000 ALTER TABLE `reference_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair_device_models`
--

DROP TABLE IF EXISTS `repair_device_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repair_device_models` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `repair_checklist` text DEFAULT NULL,
  `brand_id` int(10) unsigned DEFAULT NULL,
  `device_id` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `repair_device_models_business_id_index` (`business_id`),
  KEY `repair_device_models_brand_id_index` (`brand_id`),
  KEY `repair_device_models_device_id_index` (`device_id`),
  KEY `repair_device_models_created_by_index` (`created_by`),
  CONSTRAINT `repair_device_models_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `repair_device_models_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `repair_device_models_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `repair_device_models_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_device_models`
--

LOCK TABLES `repair_device_models` WRITE;
/*!40000 ALTER TABLE `repair_device_models` DISABLE KEYS */;
/*!40000 ALTER TABLE `repair_device_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair_job_sheets`
--

DROP TABLE IF EXISTS `repair_job_sheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repair_job_sheets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned DEFAULT NULL,
  `contact_id` int(10) unsigned NOT NULL,
  `job_sheet_no` varchar(191) NOT NULL,
  `service_type` enum('carry_in','pick_up','on_site') NOT NULL,
  `pick_up_on_site_addr` text DEFAULT NULL,
  `brand_id` int(10) unsigned DEFAULT NULL,
  `device_id` int(10) unsigned DEFAULT NULL,
  `device_model_id` int(10) unsigned DEFAULT NULL,
  `checklist` text DEFAULT NULL,
  `security_pwd` varchar(191) DEFAULT NULL,
  `security_pattern` varchar(191) DEFAULT NULL,
  `serial_no` varchar(191) NOT NULL,
  `status_id` int(11) NOT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `product_configuration` text DEFAULT NULL,
  `defects` text DEFAULT NULL,
  `product_condition` text DEFAULT NULL,
  `service_staff` int(10) unsigned DEFAULT NULL,
  `comment_by_ss` text DEFAULT NULL COMMENT 'comment made by technician',
  `estimated_cost` decimal(22,4) DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `parts` text DEFAULT NULL,
  `custom_field_1` varchar(191) DEFAULT NULL,
  `custom_field_2` varchar(191) DEFAULT NULL,
  `custom_field_3` varchar(191) DEFAULT NULL,
  `custom_field_4` varchar(191) DEFAULT NULL,
  `custom_field_5` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `repair_job_sheets_business_id_index` (`business_id`),
  KEY `repair_job_sheets_location_id_index` (`location_id`),
  KEY `repair_job_sheets_contact_id_index` (`contact_id`),
  KEY `repair_job_sheets_brand_id_index` (`brand_id`),
  KEY `repair_job_sheets_device_id_index` (`device_id`),
  KEY `repair_job_sheets_device_model_id_index` (`device_model_id`),
  KEY `repair_job_sheets_status_id_index` (`status_id`),
  KEY `repair_job_sheets_service_staff_index` (`service_staff`),
  KEY `repair_job_sheets_created_by_index` (`created_by`),
  CONSTRAINT `repair_job_sheets_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `repair_job_sheets_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `repair_job_sheets_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `repair_job_sheets_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `repair_job_sheets_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `repair_job_sheets_device_model_id_foreign` FOREIGN KEY (`device_model_id`) REFERENCES `repair_device_models` (`id`),
  CONSTRAINT `repair_job_sheets_service_staff_foreign` FOREIGN KEY (`service_staff`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_job_sheets`
--

LOCK TABLES `repair_job_sheets` WRITE;
/*!40000 ALTER TABLE `repair_job_sheets` DISABLE KEYS */;
/*!40000 ALTER TABLE `repair_job_sheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair_statuses`
--

DROP TABLE IF EXISTS `repair_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repair_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `color` varchar(191) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `is_completed_status` tinyint(1) NOT NULL DEFAULT 0,
  `sms_template` text DEFAULT NULL,
  `email_subject` text DEFAULT NULL,
  `email_body` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_statuses`
--

LOCK TABLES `repair_statuses` WRITE;
/*!40000 ALTER TABLE `repair_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `repair_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `res_product_modifier_sets`
--

DROP TABLE IF EXISTS `res_product_modifier_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_product_modifier_sets` (
  `modifier_set_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product',
  KEY `res_product_modifier_sets_modifier_set_id_foreign` (`modifier_set_id`),
  CONSTRAINT `res_product_modifier_sets_modifier_set_id_foreign` FOREIGN KEY (`modifier_set_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `res_product_modifier_sets`
--

LOCK TABLES `res_product_modifier_sets` WRITE;
/*!40000 ALTER TABLE `res_product_modifier_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `res_product_modifier_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `res_tables`
--

DROP TABLE IF EXISTS `res_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_tables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `res_tables_business_id_foreign` (`business_id`),
  CONSTRAINT `res_tables_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `res_tables`
--

LOCK TABLES `res_tables` WRITE;
/*!40000 ALTER TABLE `res_tables` DISABLE KEYS */;
/*!40000 ALTER TABLE `res_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (39,2),(40,2),(62,2),(63,2),(64,2),(65,2),(94,2);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `business_id` int(10) unsigned NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_service_staff` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_business_id_foreign` (`business_id`),
  CONSTRAINT `roles_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin#1','web',1,1,0,'2023-08-28 17:44:13','2023-08-28 17:44:13'),(2,'Cashier#1','web',1,0,0,'2023-08-28 17:44:13','2023-08-28 17:44:13');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sell_line_warranties`
--

DROP TABLE IF EXISTS `sell_line_warranties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sell_line_warranties` (
  `sell_line_id` int(11) NOT NULL,
  `warranty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sell_line_warranties`
--

LOCK TABLES `sell_line_warranties` WRITE;
/*!40000 ALTER TABLE `sell_line_warranties` DISABLE KEYS */;
/*!40000 ALTER TABLE `sell_line_warranties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selling_price_groups`
--

DROP TABLE IF EXISTS `selling_price_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selling_price_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `business_id` int(10) unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `selling_price_groups_business_id_foreign` (`business_id`),
  CONSTRAINT `selling_price_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selling_price_groups`
--

LOCK TABLES `selling_price_groups` WRITE;
/*!40000 ALTER TABLE `selling_price_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `selling_price_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sheet_spreadsheet_shares`
--

DROP TABLE IF EXISTS `sheet_spreadsheet_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sheet_spreadsheet_shares` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sheet_spreadsheet_id` bigint(20) unsigned NOT NULL,
  `shared_with` varchar(191) NOT NULL COMMENT 'Shared with like user/role/todo',
  `shared_id` int(11) NOT NULL COMMENT 'Id of shared with like user_id/role_id/todo_id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sheet_spreadsheet_shares_sheet_spreadsheet_id_foreign` (`sheet_spreadsheet_id`),
  KEY `sheet_spreadsheet_shares_shared_with_index` (`shared_with`),
  KEY `sheet_spreadsheet_shares_shared_id_index` (`shared_id`),
  CONSTRAINT `sheet_spreadsheet_shares_sheet_spreadsheet_id_foreign` FOREIGN KEY (`sheet_spreadsheet_id`) REFERENCES `sheet_spreadsheets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sheet_spreadsheet_shares`
--

LOCK TABLES `sheet_spreadsheet_shares` WRITE;
/*!40000 ALTER TABLE `sheet_spreadsheet_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `sheet_spreadsheet_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sheet_spreadsheets`
--

DROP TABLE IF EXISTS `sheet_spreadsheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sheet_spreadsheets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `sheet_data` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `folder_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sheet_spreadsheets_business_id_foreign` (`business_id`),
  KEY `sheet_spreadsheets_created_by_index` (`created_by`),
  CONSTRAINT `sheet_spreadsheets_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sheet_spreadsheets`
--

LOCK TABLES `sheet_spreadsheets` WRITE;
/*!40000 ALTER TABLE `sheet_spreadsheets` DISABLE KEYS */;
/*!40000 ALTER TABLE `sheet_spreadsheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_adjustment_lines`
--

DROP TABLE IF EXISTS `stock_adjustment_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_adjustment_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `variation_id` int(10) unsigned NOT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `secondary_unit_quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Last purchase unit price',
  `removed_purchase_line` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_adjustment_lines_product_id_foreign` (`product_id`),
  KEY `stock_adjustment_lines_variation_id_foreign` (`variation_id`),
  KEY `stock_adjustment_lines_transaction_id_index` (`transaction_id`),
  KEY `stock_adjustment_lines_lot_no_line_id_index` (`lot_no_line_id`),
  CONSTRAINT `stock_adjustment_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stock_adjustment_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stock_adjustment_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_adjustment_lines`
--

LOCK TABLES `stock_adjustment_lines` WRITE;
/*!40000 ALTER TABLE `stock_adjustment_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_adjustment_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_adjustments_temp`
--

DROP TABLE IF EXISTS `stock_adjustments_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_adjustments_temp` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_adjustments_temp`
--

LOCK TABLES `stock_adjustments_temp` WRITE;
/*!40000 ALTER TABLE `stock_adjustments_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_adjustments_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `package_id` int(10) unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `trial_end_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `package_price` decimal(22,4) NOT NULL,
  `package_details` longtext NOT NULL,
  `created_id` int(10) unsigned NOT NULL,
  `paid_via` varchar(191) DEFAULT NULL,
  `payment_transaction_id` varchar(191) DEFAULT NULL,
  `status` enum('approved','waiting','declined') NOT NULL DEFAULT 'waiting',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptions_business_id_foreign` (`business_id`),
  KEY `subscriptions_package_id_index` (`package_id`),
  KEY `subscriptions_created_id_index` (`created_id`),
  CONSTRAINT `subscriptions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (1,1,1,'2023-08-28','2113-09-07','2113-08-28',0.0000,'{\"location_count\":\"0\",\"user_count\":\"0\",\"product_count\":\"0\",\"invoice_count\":\"0\",\"name\":\"ADMIN\",\"accounting_module\":\"1\",\"aiassistance_module\":\"1\",\"aiassistance_max_token\":null,\"assetmanagement_module\":\"1\",\"connector_module\":\"1\",\"essentials_module\":\"1\",\"productcatalogue_module\":\"1\",\"project_module\":\"1\",\"repair_module\":\"1\",\"spreadsheet_module\":\"1\"}',1,'offline','0','approved',NULL,'2023-08-28 17:50:26','2023-08-28 17:56:47');
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superadmin_communicator_logs`
--

DROP TABLE IF EXISTS `superadmin_communicator_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `superadmin_communicator_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_ids` text DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superadmin_communicator_logs`
--

LOCK TABLES `superadmin_communicator_logs` WRITE;
/*!40000 ALTER TABLE `superadmin_communicator_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `superadmin_communicator_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superadmin_frontend_pages`
--

DROP TABLE IF EXISTS `superadmin_frontend_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `superadmin_frontend_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `content` longtext NOT NULL,
  `is_shown` tinyint(1) NOT NULL,
  `menu_order` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superadmin_frontend_pages`
--

LOCK TABLES `superadmin_frontend_pages` WRITE;
/*!40000 ALTER TABLE `superadmin_frontend_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `superadmin_frontend_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system`
--

DROP TABLE IF EXISTS `system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system`
--

LOCK TABLES `system` WRITE;
/*!40000 ALTER TABLE `system` DISABLE KEYS */;
INSERT INTO `system` VALUES (1,'db_version','5.0'),(2,'default_business_active_status','1'),(3,'superadmin_version','4.0'),(4,'app_currency_id','2'),(5,'invoice_business_name','Mhamcloud'),(6,'invoice_business_landmark','Landmark'),(7,'invoice_business_zip','Zip'),(8,'invoice_business_state','State'),(9,'invoice_business_city','City'),(10,'invoice_business_country','Country'),(11,'email','superadmin@example.com'),(12,'package_expiry_alert_days','5'),(13,'enable_business_based_username','0'),(14,'repair_version','2.0'),(15,'essentials_version','4.0'),(16,'project_version','2.0'),(17,'connector_version','2.0'),(18,'assetmanagement_version','2.0'),(19,'productcatalogue_version','1.0'),(20,'spreadsheet_version','1.0'),(21,'aiassistance_version','1.0'),(22,'accounting_version','0.7'),(23,'superadmin_register_tc',NULL),(24,'welcome_email_subject',NULL),(25,'welcome_email_body',NULL),(26,'additional_js',NULL),(27,'additional_css',NULL),(28,'offline_payment_details',NULL),(29,'superadmin_enable_register_tc','0'),(30,'allow_email_settings_to_businesses','0'),(31,'enable_new_business_registration_notification','0'),(32,'enable_new_subscription_notification','0'),(33,'enable_welcome_email','0'),(34,'enable_offline_payment','1'),(35,'cms_version','1.0'),(36,'manufacturing_version','2.0');
/*!40000 ALTER TABLE `system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `amount` double(22,4) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT 0,
  `for_tax_group` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tax_rates_business_id_foreign` (`business_id`),
  KEY `tax_rates_created_by_foreign` (`created_by`),
  CONSTRAINT `tax_rates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tax_rates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rates`
--

LOCK TABLES `tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_payments`
--

DROP TABLE IF EXISTS `transaction_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) unsigned DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Used during sales to return the change',
  `amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `method` varchar(191) DEFAULT NULL,
  `payment_type` varchar(191) DEFAULT NULL,
  `transaction_no` varchar(191) DEFAULT NULL,
  `card_transaction_number` varchar(191) DEFAULT NULL,
  `card_number` varchar(191) DEFAULT NULL,
  `card_type` varchar(191) DEFAULT NULL,
  `card_holder_name` varchar(191) DEFAULT NULL,
  `card_month` varchar(191) DEFAULT NULL,
  `card_year` varchar(191) DEFAULT NULL,
  `card_security` varchar(5) DEFAULT NULL,
  `cheque_number` varchar(191) DEFAULT NULL,
  `bank_account_number` varchar(191) DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `paid_through_link` tinyint(1) NOT NULL DEFAULT 0,
  `gateway` varchar(191) DEFAULT NULL,
  `is_advance` tinyint(1) NOT NULL DEFAULT 0,
  `payment_for` int(11) DEFAULT NULL COMMENT 'stores the contact id',
  `parent_id` int(11) DEFAULT NULL,
  `note` varchar(191) DEFAULT NULL,
  `document` varchar(191) DEFAULT NULL,
  `payment_ref_no` varchar(191) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_payments_transaction_id_foreign` (`transaction_id`),
  KEY `transaction_payments_created_by_index` (`created_by`),
  KEY `transaction_payments_parent_id_index` (`parent_id`),
  KEY `transaction_payments_payment_type_index` (`payment_type`),
  CONSTRAINT `transaction_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_payments`
--

LOCK TABLES `transaction_payments` WRITE;
/*!40000 ALTER TABLE `transaction_payments` DISABLE KEYS */;
INSERT INTO `transaction_payments` VALUES (1,1,1,0,100.0000,'cash',NULL,NULL,NULL,NULL,'credit',NULL,NULL,NULL,NULL,NULL,NULL,'2023-08-29 00:21:42',1,0,NULL,0,1,NULL,NULL,NULL,'SP2023/0001',NULL,'2023-08-28 18:21:42','2023-08-28 18:21:42');
/*!40000 ALTER TABLE `transaction_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_sell_lines`
--

DROP TABLE IF EXISTS `transaction_sell_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_sell_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `variation_id` int(10) unsigned NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_waste_percent` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `secondary_unit_quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `unit_price_before_discount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Sell price excluding tax',
  `line_discount_type` enum('fixed','percentage') DEFAULT NULL,
  `line_discount_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) unsigned DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `sell_line_note` text DEFAULT NULL,
  `so_line_id` int(11) DEFAULT NULL,
  `so_quantity_invoiced` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `res_service_staff_id` int(11) DEFAULT NULL,
  `res_line_order_status` varchar(191) DEFAULT NULL,
  `parent_sell_line_id` int(11) DEFAULT NULL,
  `children_type` varchar(191) NOT NULL DEFAULT '' COMMENT 'Type of children for the parent, like modifier or combo',
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_sell_lines_transaction_id_foreign` (`transaction_id`),
  KEY `transaction_sell_lines_product_id_foreign` (`product_id`),
  KEY `transaction_sell_lines_variation_id_foreign` (`variation_id`),
  KEY `transaction_sell_lines_tax_id_foreign` (`tax_id`),
  KEY `transaction_sell_lines_children_type_index` (`children_type`),
  KEY `transaction_sell_lines_parent_sell_line_id_index` (`parent_sell_line_id`),
  KEY `transaction_sell_lines_line_discount_type_index` (`line_discount_type`),
  KEY `transaction_sell_lines_discount_id_index` (`discount_id`),
  KEY `transaction_sell_lines_lot_no_line_id_index` (`lot_no_line_id`),
  KEY `transaction_sell_lines_sub_unit_id_index` (`sub_unit_id`),
  CONSTRAINT `transaction_sell_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transaction_sell_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transaction_sell_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transaction_sell_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_sell_lines`
--

LOCK TABLES `transaction_sell_lines` WRITE;
/*!40000 ALTER TABLE `transaction_sell_lines` DISABLE KEYS */;
INSERT INTO `transaction_sell_lines` VALUES (1,1,1,1,1.0000,0.0000,0.0000,0.0000,100.0000,100.0000,'fixed',0.0000,100.0000,0.0000,NULL,NULL,NULL,'',NULL,0.0000,NULL,NULL,NULL,'',NULL,'2023-08-28 18:21:42','2023-08-28 18:21:42');
/*!40000 ALTER TABLE `transaction_sell_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_sell_lines_purchase_lines`
--

DROP TABLE IF EXISTS `transaction_sell_lines_purchase_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_sell_lines_purchase_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sell_line_id` int(10) unsigned DEFAULT NULL COMMENT 'id from transaction_sell_lines',
  `stock_adjustment_line_id` int(10) unsigned DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int(10) unsigned NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(22,4) NOT NULL,
  `qty_returned` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sell_line_id` (`sell_line_id`),
  KEY `stock_adjustment_line_id` (`stock_adjustment_line_id`),
  KEY `purchase_line_id` (`purchase_line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_sell_lines_purchase_lines`
--

LOCK TABLES `transaction_sell_lines_purchase_lines` WRITE;
/*!40000 ALTER TABLE `transaction_sell_lines_purchase_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_sell_lines_purchase_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned DEFAULT NULL,
  `res_table_id` int(10) unsigned DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int(10) unsigned DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `sub_type` varchar(20) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `sub_status` varchar(191) DEFAULT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT 0,
  `payment_status` enum('paid','due','partial') DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') DEFAULT NULL,
  `contact_id` int(11) unsigned DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) DEFAULT NULL,
  `ref_no` varchar(191) DEFAULT NULL,
  `source` varchar(191) DEFAULT NULL,
  `subscription_no` varchar(191) DEFAULT NULL,
  `subscription_repeat_on` varchar(191) DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total before the purchase/invoice tax, this includeds the indivisual product tax',
  `tax_id` int(10) unsigned DEFAULT NULL,
  `tax_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `discount_type` enum('fixed','percentage') DEFAULT NULL,
  `discount_amount` decimal(22,4) DEFAULT 0.0000,
  `rp_redeemed` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `rp_redeemed_amount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'rp is the short form of reward points',
  `shipping_details` varchar(191) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `shipping_status` varchar(191) DEFAULT NULL,
  `delivered_to` varchar(191) DEFAULT NULL,
  `shipping_charges` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `shipping_custom_field_1` varchar(191) DEFAULT NULL,
  `shipping_custom_field_2` varchar(191) DEFAULT NULL,
  `shipping_custom_field_3` varchar(191) DEFAULT NULL,
  `shipping_custom_field_4` varchar(191) DEFAULT NULL,
  `shipping_custom_field_5` varchar(191) DEFAULT NULL,
  `additional_notes` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `is_export` tinyint(1) NOT NULL DEFAULT 0,
  `export_custom_fields_info` longtext DEFAULT NULL,
  `round_off_amount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Difference of rounded total and actual total',
  `additional_expense_key_1` varchar(191) DEFAULT NULL,
  `additional_expense_value_1` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_2` varchar(191) DEFAULT NULL,
  `additional_expense_value_2` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_3` varchar(191) DEFAULT NULL,
  `additional_expense_value_3` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_4` varchar(191) DEFAULT NULL,
  `additional_expense_value_4` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `final_total` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `expense_category_id` int(10) unsigned DEFAULT NULL,
  `expense_sub_category_id` int(11) DEFAULT NULL,
  `expense_for` int(10) unsigned DEFAULT NULL,
  `commission_agent` int(11) DEFAULT NULL,
  `document` varchar(191) DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT 0,
  `is_suspend` tinyint(1) NOT NULL DEFAULT 0,
  `exchange_rate` decimal(20,3) NOT NULL DEFAULT 1.000,
  `total_amount_recovered` decimal(22,4) DEFAULT NULL COMMENT 'Used for stock adjustment.',
  `transfer_parent_id` int(11) DEFAULT NULL,
  `return_parent_id` int(11) DEFAULT NULL,
  `opening_stock_product_id` int(11) DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `mfg_parent_production_purchase_id` int(11) DEFAULT NULL,
  `mfg_wasted_units` decimal(22,4) DEFAULT NULL,
  `mfg_production_cost` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_is_final` tinyint(1) NOT NULL DEFAULT 0,
  `purchase_requisition_ids` text DEFAULT NULL,
  `prefer_payment_method` varchar(191) DEFAULT NULL,
  `prefer_payment_account` int(11) DEFAULT NULL,
  `sales_order_ids` text DEFAULT NULL,
  `purchase_order_ids` text DEFAULT NULL,
  `custom_field_1` varchar(191) DEFAULT NULL,
  `custom_field_2` varchar(191) DEFAULT NULL,
  `custom_field_3` varchar(191) DEFAULT NULL,
  `custom_field_4` varchar(191) DEFAULT NULL,
  `import_batch` int(11) DEFAULT NULL,
  `import_time` datetime DEFAULT NULL,
  `types_of_service_id` int(11) DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') DEFAULT NULL,
  `service_custom_field_1` text DEFAULT NULL,
  `service_custom_field_2` text DEFAULT NULL,
  `service_custom_field_3` text DEFAULT NULL,
  `service_custom_field_4` text DEFAULT NULL,
  `service_custom_field_5` text DEFAULT NULL,
  `service_custom_field_6` text DEFAULT NULL,
  `is_created_from_api` tinyint(1) NOT NULL DEFAULT 0,
  `essentials_duration` decimal(8,2) NOT NULL,
  `essentials_duration_unit` varchar(20) DEFAULT NULL,
  `essentials_amount_per_unit_duration` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `essentials_allowances` text DEFAULT NULL,
  `essentials_deductions` text DEFAULT NULL,
  `rp_earned` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `repair_completed_on` datetime DEFAULT NULL,
  `repair_warranty_id` int(11) DEFAULT NULL,
  `repair_brand_id` int(11) DEFAULT NULL,
  `repair_status_id` int(11) DEFAULT NULL,
  `repair_model_id` int(11) DEFAULT NULL,
  `repair_job_sheet_id` int(10) unsigned DEFAULT NULL,
  `repair_defects` text DEFAULT NULL,
  `repair_serial_no` varchar(191) DEFAULT NULL,
  `repair_checklist` text DEFAULT NULL,
  `repair_security_pwd` varchar(191) DEFAULT NULL,
  `repair_security_pattern` varchar(191) DEFAULT NULL,
  `repair_due_date` datetime DEFAULT NULL,
  `repair_device_id` int(11) DEFAULT NULL,
  `repair_updates_notif` tinyint(1) NOT NULL DEFAULT 0,
  `order_addresses` text DEFAULT NULL,
  `is_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `recur_interval` double(22,4) DEFAULT NULL,
  `recur_interval_type` enum('days','months','years') DEFAULT NULL,
  `recur_repetitions` int(11) DEFAULT NULL,
  `recur_stopped_on` datetime DEFAULT NULL,
  `recur_parent_id` int(11) DEFAULT NULL,
  `invoice_token` varchar(191) DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') DEFAULT NULL,
  `pjt_project_id` int(10) unsigned DEFAULT NULL,
  `pjt_title` varchar(191) DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_tax_id_foreign` (`tax_id`),
  KEY `transactions_business_id_index` (`business_id`),
  KEY `transactions_type_index` (`type`),
  KEY `transactions_contact_id_index` (`contact_id`),
  KEY `transactions_transaction_date_index` (`transaction_date`),
  KEY `transactions_created_by_index` (`created_by`),
  KEY `transactions_location_id_index` (`location_id`),
  KEY `transactions_expense_for_foreign` (`expense_for`),
  KEY `transactions_expense_category_id_index` (`expense_category_id`),
  KEY `transactions_repair_model_id_index` (`repair_model_id`),
  KEY `transactions_sub_type_index` (`sub_type`),
  KEY `transactions_return_parent_id_index` (`return_parent_id`),
  KEY `type` (`type`),
  KEY `transactions_pjt_project_id_foreign` (`pjt_project_id`),
  KEY `transactions_status_index` (`status`),
  KEY `transactions_sub_status_index` (`sub_status`),
  KEY `transactions_res_table_id_index` (`res_table_id`),
  KEY `transactions_res_waiter_id_index` (`res_waiter_id`),
  KEY `transactions_res_order_status_index` (`res_order_status`),
  KEY `transactions_payment_status_index` (`payment_status`),
  KEY `transactions_discount_type_index` (`discount_type`),
  KEY `transactions_commission_agent_index` (`commission_agent`),
  KEY `transactions_transfer_parent_id_index` (`transfer_parent_id`),
  KEY `transactions_types_of_service_id_index` (`types_of_service_id`),
  KEY `transactions_packing_charge_type_index` (`packing_charge_type`),
  KEY `transactions_recur_parent_id_index` (`recur_parent_id`),
  KEY `transactions_selling_price_group_id_index` (`selling_price_group_id`),
  KEY `transactions_repair_warranty_id_index` (`repair_warranty_id`),
  KEY `transactions_repair_brand_id_index` (`repair_brand_id`),
  KEY `transactions_repair_status_id_index` (`repair_status_id`),
  KEY `transactions_repair_device_id_index` (`repair_device_id`),
  KEY `transactions_repair_job_sheet_id_index` (`repair_job_sheet_id`),
  KEY `transactions_delivery_date_index` (`delivery_date`),
  CONSTRAINT `transactions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_expense_for_foreign` FOREIGN KEY (`expense_for`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  CONSTRAINT `transactions_pjt_project_id_foreign` FOREIGN KEY (`pjt_project_id`) REFERENCES `pjt_projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_repair_job_sheet_id_foreign` FOREIGN KEY (`repair_job_sheet_id`) REFERENCES `repair_job_sheets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,1,NULL,NULL,NULL,'sell',NULL,'final',NULL,0,'paid',NULL,1,NULL,'0001','',NULL,NULL,NULL,'2023-08-29 00:21:42',100.0000,NULL,0.0000,'percentage',0.0000,0,0.0000,NULL,NULL,NULL,NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0.0000,NULL,0.0000,NULL,0.0000,NULL,0.0000,NULL,0.0000,100.0000,NULL,NULL,NULL,NULL,NULL,0,0,1.000,NULL,NULL,NULL,NULL,1,NULL,NULL,0.0000,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0.00,NULL,0.0000,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,1.0000,'days',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2023-08-28 18:21:42','2023-08-28 18:21:42');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_of_services`
--

DROP TABLE IF EXISTS `types_of_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types_of_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `location_price_group` text DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') DEFAULT NULL,
  `enable_custom_fields` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `types_of_services_business_id_index` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_of_services`
--

LOCK TABLES `types_of_services` WRITE;
/*!40000 ALTER TABLE `types_of_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `types_of_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `actual_name` varchar(191) NOT NULL,
  `short_name` varchar(191) NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `base_unit_id` int(11) DEFAULT NULL,
  `base_unit_multiplier` decimal(20,4) DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `units_business_id_foreign` (`business_id`),
  KEY `units_created_by_foreign` (`created_by`),
  KEY `units_base_unit_id_index` (`base_unit_id`),
  CONSTRAINT `units_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `units_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,1,'Pieces','Pc(s)',0,NULL,NULL,1,NULL,'2023-08-28 17:44:13','2023-08-28 17:44:13');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_contact_access`
--

DROP TABLE IF EXISTS `user_contact_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_contact_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_contact_access_user_id_index` (`user_id`),
  KEY `user_contact_access_contact_id_index` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_contact_access`
--

LOCK TABLES `user_contact_access` WRITE;
/*!40000 ALTER TABLE `user_contact_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_contact_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(191) NOT NULL DEFAULT 'user',
  `surname` char(10) DEFAULT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `username` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `language` char(7) NOT NULL DEFAULT 'en',
  `contact_no` char(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `business_id` int(10) unsigned DEFAULT NULL,
  `available_at` datetime DEFAULT NULL COMMENT 'Service staff avilable at. Calculated from product preparation_time_in_minutes',
  `paused_at` datetime DEFAULT NULL COMMENT 'Service staff available time paused at, Will be nulled on resume.',
  `max_sales_discount_percent` decimal(5,2) DEFAULT NULL,
  `allow_login` tinyint(1) NOT NULL DEFAULT 1,
  `essentials_department_id` int(11) DEFAULT NULL,
  `essentials_designation_id` int(11) DEFAULT NULL,
  `essentials_salary` decimal(22,4) DEFAULT NULL,
  `essentials_pay_period` varchar(191) DEFAULT NULL,
  `essentials_pay_cycle` varchar(191) DEFAULT NULL,
  `status` enum('active','inactive','terminated') NOT NULL DEFAULT 'active',
  `crm_contact_id` int(10) unsigned DEFAULT NULL,
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT 0,
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT 0.00,
  `selected_contacts` tinyint(1) NOT NULL DEFAULT 0,
  `dob` date DEFAULT NULL,
  `gender` varchar(191) DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') DEFAULT NULL,
  `blood_group` char(10) DEFAULT NULL,
  `contact_number` char(20) DEFAULT NULL,
  `alt_number` varchar(191) DEFAULT NULL,
  `family_number` varchar(191) DEFAULT NULL,
  `fb_link` varchar(191) DEFAULT NULL,
  `twitter_link` varchar(191) DEFAULT NULL,
  `social_media_1` varchar(191) DEFAULT NULL,
  `social_media_2` varchar(191) DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `current_address` text DEFAULT NULL,
  `guardian_name` varchar(191) DEFAULT NULL,
  `custom_field_1` varchar(191) DEFAULT NULL,
  `custom_field_2` varchar(191) DEFAULT NULL,
  `custom_field_3` varchar(191) DEFAULT NULL,
  `custom_field_4` varchar(191) DEFAULT NULL,
  `bank_details` longtext DEFAULT NULL,
  `id_proof_name` varchar(191) DEFAULT NULL,
  `id_proof_number` varchar(191) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL COMMENT 'user primary work location',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_business_id_foreign` (`business_id`),
  KEY `users_user_type_index` (`user_type`),
  KEY `users_essentials_department_id_index` (`essentials_department_id`),
  KEY `users_essentials_designation_id_index` (`essentials_designation_id`),
  KEY `users_crm_contact_id_foreign` (`crm_contact_id`),
  CONSTRAINT `users_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_crm_contact_id_foreign` FOREIGN KEY (`crm_contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user','Mr','Zillur','Rahman','supperadmin',NULL,'$2y$10$L3sYW1ZNMxdkpwbUddf4YeE4/UrIXIhYA448ngwPuUQED6eCEsHKi','en',NULL,NULL,NULL,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'active',NULL,0,0.00,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-08-28 17:44:13','2023-08-28 17:44:13');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variation_group_prices`
--

DROP TABLE IF EXISTS `variation_group_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variation_group_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `variation_id` int(10) unsigned NOT NULL,
  `price_group_id` int(10) unsigned NOT NULL,
  `price_inc_tax` decimal(22,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variation_group_prices_variation_id_foreign` (`variation_id`),
  KEY `variation_group_prices_price_group_id_foreign` (`price_group_id`),
  CONSTRAINT `variation_group_prices_price_group_id_foreign` FOREIGN KEY (`price_group_id`) REFERENCES `selling_price_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `variation_group_prices_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variation_group_prices`
--

LOCK TABLES `variation_group_prices` WRITE;
/*!40000 ALTER TABLE `variation_group_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `variation_group_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variation_location_details`
--

DROP TABLE IF EXISTS `variation_location_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variation_location_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `product_variation_id` int(10) unsigned NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `qty_available` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variation_location_details_location_id_foreign` (`location_id`),
  KEY `variation_location_details_product_id_index` (`product_id`),
  KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  KEY `variation_location_details_variation_id_index` (`variation_id`),
  CONSTRAINT `variation_location_details_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  CONSTRAINT `variation_location_details_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variation_location_details`
--

LOCK TABLES `variation_location_details` WRITE;
/*!40000 ALTER TABLE `variation_location_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `variation_location_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variation_templates`
--

DROP TABLE IF EXISTS `variation_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variation_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variation_templates_business_id_foreign` (`business_id`),
  CONSTRAINT `variation_templates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variation_templates`
--

LOCK TABLES `variation_templates` WRITE;
/*!40000 ALTER TABLE `variation_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `variation_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variation_value_templates`
--

DROP TABLE IF EXISTS `variation_value_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variation_value_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `variation_template_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variation_value_templates_name_index` (`name`),
  KEY `variation_value_templates_variation_template_id_index` (`variation_template_id`),
  CONSTRAINT `variation_value_templates_variation_template_id_foreign` FOREIGN KEY (`variation_template_id`) REFERENCES `variation_templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variation_value_templates`
--

LOCK TABLES `variation_value_templates` WRITE;
/*!40000 ALTER TABLE `variation_value_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `variation_value_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variations`
--

DROP TABLE IF EXISTS `variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `sub_sku` varchar(191) DEFAULT NULL,
  `product_variation_id` int(10) unsigned NOT NULL,
  `variation_value_id` int(11) DEFAULT NULL,
  `default_purchase_price` decimal(22,4) DEFAULT NULL,
  `dpp_inc_tax` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `profit_percent` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `default_sell_price` decimal(22,4) DEFAULT NULL,
  `sell_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `combo_variations` text DEFAULT NULL COMMENT 'Contains the combo variation details',
  PRIMARY KEY (`id`),
  KEY `variations_product_id_foreign` (`product_id`),
  KEY `variations_product_variation_id_foreign` (`product_variation_id`),
  KEY `variations_name_index` (`name`),
  KEY `variations_sub_sku_index` (`sub_sku`),
  KEY `variations_variation_value_id_index` (`variation_value_id`),
  CONSTRAINT `variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `variations_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variations`
--

LOCK TABLES `variations` WRITE;
/*!40000 ALTER TABLE `variations` DISABLE KEYS */;
INSERT INTO `variations` VALUES (1,'DUMMY',1,'0001',1,NULL,100.0000,100.0000,0.0000,100.0000,100.0000,'2023-08-28 18:21:19','2023-08-28 18:21:19',NULL,'[]');
/*!40000 ALTER TABLE `variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warranties`
--

DROP TABLE IF EXISTS `warranties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warranties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `business_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `duration_type` enum('days','months','years') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warranties_business_id_index` (`business_id`),
  KEY `warranties_duration_type_index` (`duration_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warranties`
--

LOCK TABLES `warranties` WRITE;
/*!40000 ALTER TABLE `warranties` DISABLE KEYS */;
/*!40000 ALTER TABLE `warranties` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-30 23:37:17
