-- ========================================================================================
-- # Copyright (c) 2026  Autodesk, Inc.
-- # Name        : schema_create_mssql.sql
-- # Description : SQL code to generate the ACC Data Schema in a MSSQL relational database
-- # Date Created: 2026-03-18
-- #
-- # THIS OFFERING IS PROVIDED "AS IS," AND AUTODESK AND ITS LICENSORS AND SUPPLIERS MAKE, 
-- # AND YOU RECEIVE, NO WARRANTIES, REPRESENTATIONS, CONDITIONS OR COMMITMENTS OF ANY KIND, 
-- # EXPRESS OR IMPLIED, WITH RESPECT TO ANY OF THE OFFERINGS OR ANY OUTPUT, INCLUDING 
-- # ANY IMPLIED WARRANTIES OF MERCHANTABILITY, SATISFACTORY QUALITY, FITNESS FOR A 
-- # PARTICULAR PURPOSE OR NON INFRINGEMENT OR OTHER WARRANTIES OR CONDITIONS IMPLIED 
-- # BY STATUTE, OR ANY WARRANTIES OR CONDITIONS BASED ON A COURSE OF DEALING, USAGE 
-- # OF TRADE OR INDUSTRY STANDARDS.
-- # 
-- # To see Autodesk's full Terms of Use, please visit: 
-- # https://www.autodesk.com/company/terms-of-use/en/general-terms
-- #========================================================================================
--
-- Create the database for data ingestion: acc_data_schema
--
USE master;
IF DB_ID (N'acc_data_schema') IS NULL
BEGIN
  CREATE DATABASE acc_data_schema;
  print 'Created database acc_data_schema.'
END
ELSE
BEGIN 
  print 'Database acc_data_schema already exists.'
END
GO

-- Use the acc_data_schema database
USE acc_data_schema;
GO

-- 
-- =================================================================
-- # Schema: activities
-- =================================================================
--
-- Table: activities_admin_activities
--
DROP TABLE IF EXISTS activities_admin_activities;
CREATE TABLE activities_admin_activities (
    "activity_id"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_verb"          ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "object_access_change_list" ntext,
    "object_added_services"  ntext,
    "object_allow_edit_company" ntext,
    "object_default_access_level" ntext,
    "object_display_name"    ntext,
    "object_id"              uniqueidentifier,
    "object_name"            ntext,
    "object_name_was"        ntext,
    "object_object_type"     ntext,
    "object_removed_services" ntext,
    "object_service_name"    ntext,
    "object_services_list"   ntext,
    "object_size"            numeric,
    "object_status"          ntext,
    "object_status_was"      ntext,
    "object_update_image"    ntext,
    "target_display_name"    ntext,
    "target_id"              uniqueidentifier,
    "target_object_type"     ntext
);

--
-- Table: activities_assets_activities
--
DROP TABLE IF EXISTS activities_assets_activities;
CREATE TABLE activities_assets_activities (
    "activity_id"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_verb"          ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "object_activity_source" ntext,
    "object_after_asset_status_color" ntext,
    "object_after_asset_status_display_name" ntext,
    "object_after_asset_status_entity_type" ntext,
    "object_after_asset_status_id" uniqueidentifier,
    "object_after_asset_status_is_active" bit,
    "object_after_asset_status_is_missing" bit,
    "object_after_asset_status_is_valid" bit,
    "object_after_category_display_name" ntext,
    "object_after_category_entity_type" ntext,
    "object_after_category_id" ntext,
    "object_after_category_is_active" bit,
    "object_after_category_is_missing" bit,
    "object_after_category_is_valid" bit,
    "object_after_category_path" ntext,
    "object_after_location_display_name" ntext,
    "object_after_location_entity_type" ntext,
    "object_after_location_id" uniqueidentifier,
    "object_after_location_is_active" bit,
    "object_after_location_is_missing" bit,
    "object_after_location_is_valid" bit,
    "object_after_location_path" ntext,
    "object_before_entity_category_id" ntext,
    "object_before_entity_client_asset_id" ntext,
    "object_before_entity_created_at" datetime,
    "object_before_entity_created_by" ntext,
    "object_before_entity_custom_attributes" ntext,
    "object_before_entity_id" uniqueidentifier,
    "object_before_entity_is_active" bit,
    "object_before_entity_location_id" uniqueidentifier,
    "object_before_entity_status_id" uniqueidentifier,
    "object_before_entity_updated_at" datetime,
    "object_before_entity_updated_by" ntext,
    "object_before_entity_version" numeric,
    "object_before_location_display_name" ntext,
    "object_before_location_entity_type" ntext,
    "object_before_location_id" uniqueidentifier,
    "object_before_location_is_active" bit,
    "object_before_location_is_missing" bit,
    "object_before_location_is_valid" bit,
    "object_before_location_path" ntext,
    "object_category_display_name" ntext,
    "object_category_entity_type" ntext,
    "object_category_id"     ntext,
    "object_category_is_active" bit,
    "object_category_is_missing" bit,
    "object_category_is_valid" bit,
    "object_category_path"   ntext,
    "object_created_entity_category_id" ntext,
    "object_created_entity_client_asset_id" ntext,
    "object_created_entity_created_at" datetime,
    "object_created_entity_created_by" ntext,
    "object_created_entity_id" uniqueidentifier,
    "object_created_entity_is_active" bit,
    "object_created_entity_status_id" uniqueidentifier,
    "object_created_entity_updated_at" datetime,
    "object_created_entity_updated_by" ntext,
    "object_created_entity_version" numeric,
    "object_deleted_entity_category_id" ntext,
    "object_deleted_entity_client_asset_id" ntext,
    "object_deleted_entity_created_at" datetime,
    "object_deleted_entity_created_by" ntext,
    "object_deleted_entity_deleted_at" datetime,
    "object_deleted_entity_deleted_by" ntext,
    "object_deleted_entity_id" uniqueidentifier,
    "object_deleted_entity_is_active" bit,
    "object_deleted_entity_location_id" uniqueidentifier,
    "object_deleted_entity_status_id" uniqueidentifier,
    "object_deleted_entity_updated_at" datetime,
    "object_deleted_entity_updated_by" ntext,
    "object_deleted_entity_version" numeric,
    "object_display_name"    ntext,
    "object_id"              uniqueidentifier,
    "object_location_display_name" ntext,
    "object_location_entity_type" ntext,
    "object_location_id"     uniqueidentifier,
    "object_location_is_active" bit,
    "object_location_is_missing" bit,
    "object_location_is_valid" bit,
    "object_location_path"   ntext,
    "object_patch_entity_custom_attributes" ntext,
    "object_patch_entity_updated_at" datetime,
    "object_patch_entity_updated_by" ntext,
    "object_asset_status_color" ntext,
    "object_asset_status_display_name" ntext,
    "object_asset_status_entity_type" ntext,
    "object_asset_status_id" uniqueidentifier,
    "object_asset_status_is_active" bit,
    "object_asset_status_is_missing" bit,
    "object_asset_status_is_valid" bit,
    "object_before_asset_status_color" ntext,
    "object_before_asset_status_display_name" ntext,
    "object_before_asset_status_entity_type" ntext,
    "object_before_asset_status_id" uniqueidentifier,
    "object_before_asset_status_is_active" bit,
    "object_before_asset_status_is_missing" bit,
    "object_before_asset_status_is_valid" bit,
    "object_before_category_display_name" ntext,
    "object_before_category_entity_type" ntext,
    "object_before_category_id" ntext,
    "object_before_category_is_active" bit,
    "object_before_category_is_missing" bit,
    "object_before_category_is_valid" bit,
    "object_before_category_path" ntext
);

--
-- Table: activities_bridge_activities
--
DROP TABLE IF EXISTS activities_bridge_activities;
CREATE TABLE activities_bridge_activities (
    "activity_id"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_verb"          ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "object_automation_type" ntext,
    "object_initiator_project_id" ntext,
    "object_item_name"       ntext,
    "object_origin"          ntext,
    "object_owner"           ntext,
    "object_reason"          ntext,
    "object_recipient_email" ntext,
    "object_source_project_account_id" ntext,
    "object_source_project_display_name" ntext,
    "object_source_project_id" ntext,
    "object_target_project_account_id" ntext,
    "object_target_project_display_name" ntext,
    "object_target_project_id" ntext
);

--
-- Table: activities_cost_activities
--
DROP TABLE IF EXISTS activities_cost_activities;
CREATE TABLE activities_cost_activities (
    "activity_id"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_verb"          ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "object_cost_payment_display_name" ntext,
    "object_cost_payment_id" uniqueidentifier,
    "object_uom_display_name" ntext,
    "object_uom_id"          ntext,
    "object_uom_type"        ntext,
    "object_abbr"            ntext,
    "object_association_association_type" ntext,
    "object_association_display_name" ntext,
    "object_association_id"  uniqueidentifier,
    "object_association_number" ntext,
    "object_association_type" ntext,
    "object_attachment_display_name" ntext,
    "object_attachment_id"   uniqueidentifier,
    "object_attachment_type" ntext,
    "object_billing_period_display_name" uniqueidentifier,
    "object_billing_period_end_date" date,
    "object_billing_period_id" uniqueidentifier,
    "object_billing_period_start_date" date,
    "object_budget_code"     ntext,
    "object_budget_display_name" ntext,
    "object_budget_id"       uniqueidentifier,
    "object_budget_payment_display_name" ntext,
    "object_budget_payment_id" uniqueidentifier,
    "object_budget_payment_type" ntext,
    "object_budgetpayment_display_name" ntext,
    "object_budgetpayment_id" uniqueidentifier,
    "object_budgets"         ntext,
    "object_calendar_configuration_display_name" ntext,
    "object_calendar_configuration_id" ntext,
    "object_code"            numeric,
    "object_comment_display_name" ntext,
    "object_comment_id"      uniqueidentifier,
    "object_compliance_definition_display_name" ntext,
    "object_compliance_definition_id" ntext,
    "object_compliance_definition_type" ntext,
    "object_compliance_requirement_display_name" ntext,
    "object_compliance_requirement_id" ntext,
    "object_compliance_requirement_type" ntext,
    "object_container_setting_display_name" ntext,
    "object_container_setting_id" uniqueidentifier,
    "object_contract_display_name" ntext,
    "object_contract_id"     uniqueidentifier,
    "object_cost_item_display_name" ntext,
    "object_cost_item_id"    uniqueidentifier,
    "object_custom_column_display_name" uniqueidentifier,
    "object_custom_column_id" uniqueidentifier,
    "object_default_value_display_name" ntext,
    "object_default_value_id" ntext,
    "object_display_name"    ntext,
    "object_distribution_display_name" uniqueidentifier,
    "object_distribution_id" uniqueidentifier,
    "object_distribution_item_display_name" ntext,
    "object_distribution_item_id" ntext,
    "object_document_package_display_name" ntext,
    "object_document_package_id" uniqueidentifier,
    "object_document_template_display_name" ntext,
    "object_document_template_id" uniqueidentifier,
    "object_document_template_type" ntext,
    "object_document_package_item_display_name" uniqueidentifier,
    "object_document_package_item_id" uniqueidentifier,
    "object_email_notification_display_name" uniqueidentifier,
    "object_email_notification_id" uniqueidentifier,
    "object_exchange_rate_display_name" ntext,
    "object_exchange_rate_id" ntext,
    "object_expense_code"    ntext,
    "object_expense_display_name" ntext,
    "object_expense_id"      uniqueidentifier,
    "object_expense_type"    ntext,
    "object_expense_item_code" numeric,
    "object_expense_item_display_name" ntext,
    "object_expense_item_id" uniqueidentifier,
    "object_forecast_adjustment_display_name" ntext,
    "object_forecast_adjustment_id" uniqueidentifier,
    "object_form_definition_display_name" ntext,
    "object_form_definition_id" uniqueidentifier,
    "object_form_instance_code" numeric,
    "object_form_instance_display_name" ntext,
    "object_form_instance_id" uniqueidentifier,
    "object_form_instance_type" ntext,
    "object_form_item_display_name" uniqueidentifier,
    "object_form_item_id"    uniqueidentifier,
    "object_from_display_name" ntext,
    "object_from_id"         uniqueidentifier,
    "object_group_key"       ntext,
    "object_id"              uniqueidentifier,
    "object_key"             ntext,
    "object_main_contract_code" numeric,
    "object_main_contract_display_name" ntext,
    "object_main_contract_id" uniqueidentifier,
    "object_main_contract_is_mile_stone" ntext,
    "object_main_contract_type" ntext,
    "object_main_contract_item_code" numeric,
    "object_main_contract_item_display_name" ntext,
    "object_main_contract_item_id" uniqueidentifier,
    "object_maincontract_display_name" ntext,
    "object_maincontract_id" uniqueidentifier,
    "object_markup_formula_display_name" ntext,
    "object_markup_formula_id" uniqueidentifier,
    "object_milestone_display_name" ntext,
    "object_milestone_id"    uniqueidentifier,
    "object_milestone_type"  ntext,
    "object_oco_display_name" ntext,
    "object_oco_id"          uniqueidentifier,
    "object_parent_display_name" ntext,
    "object_parent_id"       uniqueidentifier,
    "object_payment_display_name" ntext,
    "object_payment_id"      uniqueidentifier,
    "object_payment_item_code" numeric,
    "object_payment_item_display_name" ntext,
    "object_payment_item_id" uniqueidentifier,
    "object_payment_reference_display_name" ntext,
    "object_payment_reference_id" ntext,
    "object_payment_reference_is_mile_stone" ntext,
    "object_payment_reference_paid_amount" ntext,
    "object_payment_reference_reference" ntext,
    "object_pco_display_name" ntext,
    "object_pco_id"          uniqueidentifier,
    "object_permission_display_name" uniqueidentifier,
    "object_permission_id"   uniqueidentifier,
    "object_permission_level" ntext,
    "object_preset"          ntext,
    "object_proceed_step_display_name" ntext,
    "object_proceed_step_id" ntext,
    "object_proceed_step_index" numeric,
    "object_proceed_step_task_definition_key" ntext,
    "object_property_definition_display_name" ntext,
    "object_property_definition_id" uniqueidentifier,
    "object_property_definition_type" ntext,
    "object_property_value_display_name" uniqueidentifier,
    "object_property_value_id" uniqueidentifier,
    "object_rco_code"        ntext,
    "object_rco_display_name" ntext,
    "object_rco_id"          uniqueidentifier,
    "object_rco_is_mile_stone" ntext,
    "object_recipient"       ntext,
    "object_resource_type"   ntext,
    "object_rfq_display_name" ntext,
    "object_rfq_id"          uniqueidentifier,
    "object_schedule_of_value_code" numeric,
    "object_schedule_of_value_display_name" ntext,
    "object_schedule_of_value_id" uniqueidentifier,
    "object_sco_display_name" ntext,
    "object_sco_id"          uniqueidentifier,
    "object_segment_display_name" ntext,
    "object_segment_id"      uniqueidentifier,
    "object_segment_value_code" numeric,
    "object_segment_value_display_name" numeric,
    "object_segment_value_id" uniqueidentifier,
    "object_source"          ntext,
    "object_source_type"     ntext,
    "object_sub_cost_item_code" numeric,
    "object_sub_cost_item_display_name" ntext,
    "object_sub_cost_item_id" uniqueidentifier,
    "object_sub_cost_item_type" ntext,
    "object_subject_id"      numeric,
    "object_subject_type"    ntext,
    "object_tax_display_name" uniqueidentifier,
    "object_tax_id"          uniqueidentifier,
    "object_tax_association_association_type" ntext,
    "object_tax_association_display_name" ntext,
    "object_tax_association_id" ntext,
    "object_tax_association_number" ntext,
    "object_tax_formula_display_name" ntext,
    "object_tax_formula_id"  uniqueidentifier,
    "object_tax_formula_item_display_name" ntext,
    "object_tax_formula_item_id" ntext,
    "object_tax_formula_item_type" ntext,
    "object_tax_item_display_name" ntext,
    "object_tax_item_id"     ntext,
    "object_template_display_name" ntext,
    "object_template_id"     uniqueidentifier,
    "object_terminated_step_display_name" ntext,
    "object_terminated_step_id" ntext,
    "object_terminated_step_index" numeric,
    "object_terminated_step_task_definition_key" ntext,
    "object_terminology_display_name" uniqueidentifier,
    "object_terminology_id"  uniqueidentifier,
    "object_terminology_type" ntext,
    "object_to"              ntext,
    "object_tracking_item_instance_code" ntext,
    "object_tracking_item_instance_display_name" ntext,
    "object_tracking_item_instance_id" ntext,
    "object_transference_display_name" uniqueidentifier,
    "object_transference_id" uniqueidentifier,
    "object_type"            ntext,
    "object_undefined_display_name" ntext,
    "object_undefined_id"    ntext,
    "object_verb_key"        ntext,
    "object_workflow_condition_display_name" uniqueidentifier,
    "object_workflow_condition_id" uniqueidentifier,
    "object_workflow_definition_display_name" ntext,
    "object_workflow_definition_id" uniqueidentifier,
    "object_workflow_instance_display_name" ntext,
    "object_workflow_instance_id" uniqueidentifier
);

--
-- Table: activities_cost_changes
--
DROP TABLE IF EXISTS activities_cost_changes;
CREATE TABLE activities_cost_changes (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_id"            ntext,
    "created_at"             datetime,
    "activity_verb"          ntext,
    "change_type"            ntext,
    "before_value"           ntext,
    "after_value"            ntext
);

--
-- Table: activities_docs_activities
--
DROP TABLE IF EXISTS activities_docs_activities;
CREATE TABLE activities_docs_activities (
    "activity_id"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_verb"          ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "object_approval_status" ntext,
    "object_collection_display_name" ntext,
    "object_collection_id"   uniqueidentifier,
    "object_collection_instance_index" numeric,
    "object_collection_size" numeric,
    "object_display_name"    ntext,
    "object_file_name"       ntext,
    "object_folder_display_name" ntext,
    "object_folder_id"       ntext,
    "object_from_set_display_name" ntext,
    "object_from_set_id"     ntext,
    "object_hyperlink_display_name" ntext,
    "object_hyperlink_hyperlink_id" ntext,
    "object_hyperlink_id"    ntext,
    "object_hyperlink_object_type" ntext,
    "object_hyperlink_parent_folder_urn" ntext,
    "object_id"              ntext,
    "object_issuance_date"   date,
    "object_new_description" ntext,
    "object_new_issuance_date" date,
    "object_object_type"     ntext,
    "object_observer_id"     ntext,
    "object_observer_name"   ntext,
    "object_observer_type"   ntext,
    "object_old_description" ntext,
    "object_old_issuance_date" date,
    "object_old_name"        ntext,
    "object_parent_folder_urn" ntext,
    "object_pending_name"    ntext,
    "object_remove_reason"   ntext,
    "object_resource_type"   ntext,
    "object_review_display_name" ntext,
    "object_review_id"       uniqueidentifier,
    "object_review_sequence_id" numeric,
    "object_reviewer_id"     ntext,
    "object_reviewer_name"   ntext,
    "object_reviewer_type"   ntext,
    "object_revision_number" ntext,
    "object_sequence_id"     numeric,
    "object_source_display_name" ntext,
    "object_source_id"       ntext,
    "object_source_object_type" ntext,
    "object_source_parent_folder_urn" ntext,
    "object_source_version"  numeric,
    "object_status"          ntext,
    "object_task_name"       ntext,
    "object_version"         numeric,
    "object_version_set_display_name" ntext,
    "object_version_set_id"  uniqueidentifier,
    "object_version_set_issuance_date" date,
    "object_version_urn"     ntext,
    "object_version_number"  numeric,
    "target_display_name"    ntext,
    "target_folder_display_name" ntext,
    "target_folder_id"       ntext,
    "target_id"              ntext,
    "target_object_type"     ntext,
    "target_parent_folder_urn" ntext,
    "target_project_account_id" uniqueidentifier,
    "target_project_id"      uniqueidentifier,
    "target_sequence_id"     numeric,
    "target_version"         numeric,
    "target_viewer_display_name" ntext,
    "target_viewer_id"       ntext
);

--
-- Table: activities_docs_custom_attribute_constraints
--
DROP TABLE IF EXISTS activities_docs_custom_attribute_constraints;
CREATE TABLE activities_docs_custom_attribute_constraints (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_id"            ntext,
    "created_at"             datetime,
    "activity_verb"          ntext,
    "id"                     numeric,
    "attribute_id"           numeric,
    "type"                   ntext,
    "length_type"            ntext,
    "max_length"             numeric,
    "min_length"             numeric,
    "default_value"          ntext
);

--
-- Table: activities_docs_custom_attributes
--
DROP TABLE IF EXISTS activities_docs_custom_attributes;
CREATE TABLE activities_docs_custom_attributes (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_id"            ntext,
    "created_at"             datetime,
    "activity_verb"          ntext,
    "id"                     numeric,
    "name"                   ntext,
    "value"                  ntext,
    "old_value"              ntext,
    "created_by"             ntext,
    "updated_by"             ntext,
    "attribute_type"         ntext
);

--
-- Table: activities_docs_naming_standards
--
DROP TABLE IF EXISTS activities_docs_naming_standards;
CREATE TABLE activities_docs_naming_standards (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_id"            ntext,
    "created_at"             datetime,
    "activity_verb"          ntext,
    "module"                 ntext,
    "name"                   ntext,
    "old_name"               ntext,
    "new_name"               ntext,
    "upload_rule"            ntext,
    "attribute_name"         ntext
);

--
-- Table: activities_docs_permissions
--
DROP TABLE IF EXISTS activities_docs_permissions;
CREATE TABLE activities_docs_permissions (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_id"            ntext,
    "created_at"             datetime,
    "activity_verb"          ntext,
    "permission"             ntext
);

--
-- Table: activities_docs_standard_attributes
--
DROP TABLE IF EXISTS activities_docs_standard_attributes;
CREATE TABLE activities_docs_standard_attributes (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_id"            ntext,
    "created_at"             datetime,
    "activity_verb"          ntext,
    "id"                     numeric,
    "name"                   ntext,
    "attribute_type"         ntext,
    "value"                  ntext
);

--
-- Table: activities_issues_activities
--
DROP TABLE IF EXISTS activities_issues_activities;
CREATE TABLE activities_issues_activities (
    "activity_id"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_verb"          ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "object_answer"          ntext,
    "object_assigned_to"     ntext,
    "object_assigned_to_type" ntext,
    "object_attachment_attachment_type" ntext,
    "object_attachment_display_name" ntext,
    "object_attachment_id"   uniqueidentifier,
    "object_attachment_name" ntext,
    "object_attachment_urn"  ntext,
    "object_attachment_urn_type" ntext,
    "object_comment_id"      uniqueidentifier,
    "object_created_at"      datetime,
    "object_display_name"    numeric,
    "object_id"              uniqueidentifier,
    "object_status"          ntext,
    "object_title"           ntext,
    "object_updated_at"      datetime
);

--
-- Table: activities_issues_changes
--
DROP TABLE IF EXISTS activities_issues_changes;
CREATE TABLE activities_issues_changes (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_id"            ntext,
    "created_at"             datetime,
    "activity_verb"          ntext,
    "change_type"            ntext,
    "before_value"           ntext,
    "after_value"            ntext
);

--
-- Table: activities_rfis_activities
--
DROP TABLE IF EXISTS activities_rfis_activities;
CREATE TABLE activities_rfis_activities (
    "activity_id"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_verb"          ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "object_comment_body"    ntext,
    "object_comment_id"      uniqueidentifier,
    "object_comment_mentions" ntext,
    "object_comment_rfi_id"  uniqueidentifier,
    "object_comment_source"  ntext,
    "object_display_name"    ntext,
    "object_id"              uniqueidentifier
);

--
-- Table: activities_rfis_changes
--
DROP TABLE IF EXISTS activities_rfis_changes;
CREATE TABLE activities_rfis_changes (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_id"            ntext,
    "created_at"             datetime,
    "activity_verb"          ntext,
    "change_type"            ntext,
    "before_value"           ntext,
    "after_value"            ntext
);

--
-- Table: activities_sheets_activities
--
DROP TABLE IF EXISTS activities_sheets_activities;
CREATE TABLE activities_sheets_activities (
    "activity_id"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_verb"          ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "object_acc_collection_display_name" ntext,
    "object_acc_collection_id" ntext,
    "object_collection_display_name" ntext,
    "object_collection_id"   uniqueidentifier,
    "object_collection_instance_index" numeric,
    "object_collection_size" numeric,
    "object_display_name"    ntext,
    "object_history_display_name" ntext,
    "object_history_id"      uniqueidentifier,
    "object_id"              uniqueidentifier,
    "object_indirect"        bit,
    "object_issuance_date"   datetime,
    "object_object_type"     ntext,
    "object_source_file"     ntext,
    "object_source_object_display_name" ntext,
    "object_source_object_history" ntext,
    "object_source_object_id" uniqueidentifier,
    "object_source_object_object_type" ntext,
    "object_source_object_project" ntext,
    "object_source_object_version_set" ntext,
    "object_target_object_display_name" ntext,
    "object_target_object_history" ntext,
    "object_target_object_id" uniqueidentifier,
    "object_target_object_object_type" ntext,
    "object_target_object_project" ntext,
    "object_target_object_version_set" ntext,
    "object_title"           ntext,
    "object_version_set_display_name" ntext,
    "object_version_set_id"  uniqueidentifier,
    "object_version_set_issuance_date" datetime,
    "target_acc_collection_display_name" ntext,
    "target_acc_collection_id" ntext,
    "target_display_name"    ntext,
    "target_history_display_name" ntext,
    "target_history_id"      ntext,
    "target_id"              uniqueidentifier,
    "target_issuance_date"   datetime,
    "target_object_type"     ntext
);

--
-- Table: activities_submittals_activities
--
DROP TABLE IF EXISTS activities_submittals_activities;
CREATE TABLE activities_submittals_activities (
    "activity_id"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_verb"          ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "object_assigned_to"     ntext,
    "object_assigned_to_field" ntext,
    "object_attachment_category" ntext,
    "object_attribute_object_type" ntext,
    "object_attribute_type"  ntext,
    "object_ball_in_court_type" ntext,
    "object_body"            ntext,
    "object_container_custom_identifier_sequence_type" ntext,
    "object_container_display_name" ntext,
    "object_container_id"    uniqueidentifier,
    "object_container_object_type" ntext,
    "object_created_by"      ntext,
    "object_created_on"      datetime,
    "object_custom_identifier" ntext,
    "object_custom_identifier_sort" ntext,
    "object_description"     ntext,
    "object_display_name"    ntext,
    "object_entities_0_created_on" datetime,
    "object_entities_0_display_name" ntext,
    "object_entities_0_domain" ntext,
    "object_entities_0_id"   ntext,
    "object_entities_0_type" ntext,
    "object_entities_1_created_on" datetime,
    "object_entities_1_display_name" ntext,
    "object_entities_1_domain" ntext,
    "object_entities_1_id"   ntext,
    "object_entities_1_type" ntext,
    "object_entities_display_name" ntext,
    "object_entities_id"     ntext,
    "object_entity_created_on" datetime,
    "object_entity_display_name" ntext,
    "object_entity_domain"   ntext,
    "object_entity_id"       ntext,
    "object_entity_type"     ntext,
    "object_id"              uniqueidentifier,
    "object_identifier"      numeric,
    "object_item_assigned_to_field" ntext,
    "object_item_ball_in_court_type" ntext,
    "object_item_custom_identifier" ntext,
    "object_item_custom_identifier_sort" ntext,
    "object_item_description" ntext,
    "object_item_display_name" ntext,
    "object_item_id"         uniqueidentifier,
    "object_item_identifier" numeric,
    "object_item_lead_time"  numeric,
    "object_item_object_type" ntext,
    "object_item_priority"   ntext,
    "object_item_required_approval_date" date,
    "object_item_required_date" date,
    "object_item_required_on_job_date" date,
    "object_item_response_comment" ntext,
    "object_item_response_id" uniqueidentifier,
    "object_item_revision"   numeric,
    "object_item_sequence_type_change" ntext,
    "object_item_state_id"   ntext,
    "object_item_status_id"  ntext,
    "object_item_submitter_due_date" date,
    "object_item_subsection" ntext,
    "object_item_title"      ntext,
    "object_item_type_id"    uniqueidentifier,
    "object_lead_time"       numeric,
    "object_name_for_activity" ntext,
    "object_new_value"       ntext,
    "object_object_type"     ntext,
    "object_old_value"       ntext,
    "object_package"         ntext,
    "object_priority"        ntext,
    "object_required_approval_date" date,
    "object_required_date"   date,
    "object_required_on_job_date" date,
    "object_resource_urns"   ntext,
    "object_response_comment" ntext,
    "object_response_id"     uniqueidentifier,
    "object_revision"        numeric,
    "object_sequence_type_change" ntext,
    "object_spec_container_custom_identifier_sequence_type" ntext,
    "object_spec_container_display_name" ntext,
    "object_spec_container_id" ntext,
    "object_spec_container_object_type" ntext,
    "object_spec_display_name" ntext,
    "object_spec_id"         uniqueidentifier,
    "object_spec_identifier" ntext,
    "object_spec_object_type" ntext,
    "object_state_from_display_name" ntext,
    "object_state_from_id"   ntext,
    "object_state_from_object_type" ntext,
    "object_state_id"        ntext,
    "object_state_to_display_name" ntext,
    "object_state_to_id"     ntext,
    "object_state_to_object_type" ntext,
    "object_status_id"       ntext,
    "object_step_id"         uniqueidentifier,
    "object_step_number"     numeric,
    "object_steps"           ntext,
    "object_submitter_due_date" date,
    "object_subsection"      ntext,
    "object_task_id"         uniqueidentifier,
    "object_tasks"           ntext,
    "object_title"           ntext,
    "object_type_container_custom_identifier_sequence_type" ntext,
    "object_type_container_display_name" ntext,
    "object_type_container_id" ntext,
    "object_type_container_object_type" ntext,
    "object_type_display_name" ntext,
    "object_type_id"         uniqueidentifier,
    "object_type_is_active"  bit,
    "object_type_key"        ntext,
    "object_type_object_type" ntext,
    "object_type_platform_id" ntext,
    "object_type_value"      ntext,
    "object_type_identifier" uniqueidentifier,
    "object_urn"             ntext,
    "object_urn_type"        ntext,
    "object_watchers"        ntext,
    "target_assigned_to_display_name" ntext,
    "target_assigned_to_human_readable_company" ntext,
    "target_assigned_to_human_readable_name" ntext,
    "target_assigned_to_id"  ntext,
    "target_assigned_to_object_type" ntext,
    "target_assigned_to_autodesk_id" ntext,
    "target_assigned_to_roles" ntext,
    "target_assigned_to_field" ntext,
    "target_ball_in_court_type" ntext,
    "target_container_custom_identifier_sequence_type" ntext,
    "target_container_display_name" ntext,
    "target_container_id"    uniqueidentifier,
    "target_container_object_type" ntext,
    "target_custom_identifier" ntext,
    "target_custom_identifier_sort" ntext,
    "target_description"     ntext,
    "target_display_name"    ntext,
    "target_id"              ntext,
    "target_identifier"      numeric,
    "target_lead_time"       numeric,
    "target_object_type"     ntext,
    "target_package_container_custom_identifier_sequence_type" ntext,
    "target_package_container_display_name" ntext,
    "target_package_container_id" uniqueidentifier,
    "target_package_container_object_type" ntext,
    "target_package_display_name" ntext,
    "target_package_id"      uniqueidentifier,
    "target_package_identifier" numeric,
    "target_package_is_deleted" bit,
    "target_package_object_type" ntext,
    "target_package_spec_display_name" ntext,
    "target_package_spec_id" uniqueidentifier,
    "target_package_spec_identifier" ntext,
    "target_package_spec_object_type" ntext,
    "target_priority"        ntext,
    "target_required_approval_date" date,
    "target_required_date"   date,
    "target_required_on_job_date" date,
    "target_response_comment" ntext,
    "target_response_id"     ntext,
    "target_revision"        numeric,
    "target_sequence_type_change" ntext,
    "target_spec_container_custom_identifier_sequence_type" ntext,
    "target_spec_container_display_name" ntext,
    "target_spec_container_id" uniqueidentifier,
    "target_spec_container_object_type" ntext,
    "target_spec_display_name" ntext,
    "target_spec_id"         ntext,
    "target_spec_identifier" ntext,
    "target_spec_object_type" ntext,
    "target_state_id"        ntext,
    "target_status_id"       ntext,
    "target_submitter_due_date" date,
    "target_subsection"      ntext,
    "target_title"           ntext,
    "target_type_container_custom_identifier_sequence_type" ntext,
    "target_type_container_display_name" ntext,
    "target_type_container_id" uniqueidentifier,
    "target_type_container_object_type" ntext,
    "target_type_display_name" ntext,
    "target_type_id"         uniqueidentifier,
    "target_type_is_active"  bit,
    "target_type_key"        ntext,
    "target_type_object_type" ntext,
    "target_type_platform_id" ntext,
    "target_type_value"      ntext,
    "target_type_identifier" uniqueidentifier
);

--
-- Table: activities_submittals_object_ball_in_court_companies
--
DROP TABLE IF EXISTS activities_submittals_object_ball_in_court_companies;
CREATE TABLE activities_submittals_object_ball_in_court_companies (
    "activity_id"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_verb"          ntext,
    "created_at"             datetime,
    "display_name"           ntext,
    "human_readable_name"    ntext,
    "id"                     ntext,
    "object_type"            ntext,
    "autodesk_id"            ntext
);

--
-- Table: activities_submittals_object_ball_in_court_roles
--
DROP TABLE IF EXISTS activities_submittals_object_ball_in_court_roles;
CREATE TABLE activities_submittals_object_ball_in_court_roles (
    "activity_id"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_verb"          ntext,
    "created_at"             datetime,
    "display_name"           ntext,
    "human_readable_name"    ntext,
    "id"                     ntext,
    "object_type"            ntext,
    "autodesk_id"            ntext
);

--
-- Table: activities_submittals_object_ball_in_court_users
--
DROP TABLE IF EXISTS activities_submittals_object_ball_in_court_users;
CREATE TABLE activities_submittals_object_ball_in_court_users (
    "activity_id"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_verb"          ntext,
    "created_at"             datetime,
    "display_name"           ntext,
    "human_readable_company" ntext,
    "human_readable_name"    ntext,
    "id"                     ntext,
    "object_type"            ntext,
    "autodesk_id"            ntext,
    "roles"                  ntext
);

--
-- Table: activities_submittals_target_ball_in_court_companies
--
DROP TABLE IF EXISTS activities_submittals_target_ball_in_court_companies;
CREATE TABLE activities_submittals_target_ball_in_court_companies (
    "activity_id"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_verb"          ntext,
    "created_at"             datetime,
    "display_name"           ntext,
    "human_readable_name"    ntext,
    "id"                     ntext,
    "object_type"            ntext,
    "autodesk_id"            ntext
);

--
-- Table: activities_submittals_target_ball_in_court_roles
--
DROP TABLE IF EXISTS activities_submittals_target_ball_in_court_roles;
CREATE TABLE activities_submittals_target_ball_in_court_roles (
    "activity_id"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_verb"          ntext,
    "created_at"             datetime,
    "display_name"           ntext,
    "human_readable_name"    ntext,
    "id"                     ntext,
    "object_type"            ntext,
    "autodesk_id"            ntext
);

--
-- Table: activities_submittals_target_ball_in_court_users
--
DROP TABLE IF EXISTS activities_submittals_target_ball_in_court_users;
CREATE TABLE activities_submittals_target_ball_in_court_users (
    "activity_id"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_verb"          ntext,
    "created_at"             datetime,
    "display_name"           ntext,
    "human_readable_company" ntext,
    "human_readable_name"    ntext,
    "id"                     ntext,
    "object_type"            ntext,
    "autodesk_id"            ntext,
    "roles"                  ntext
);

--
-- Table: activities_submittals_target_steps
--
DROP TABLE IF EXISTS activities_submittals_target_steps;
CREATE TABLE activities_submittals_target_steps (
    "activity_id"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_verb"          ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "completed_at"           datetime,
    "days_to_respond"        numeric,
    "display_name"           ntext,
    "due_date"               date,
    "id"                     uniqueidentifier,
    "object_type"            ntext,
    "started_at"             datetime,
    "status"                 ntext,
    "step_number"            numeric
);

--
-- Table: activities_submittals_target_tasks
--
DROP TABLE IF EXISTS activities_submittals_target_tasks;
CREATE TABLE activities_submittals_target_tasks (
    "activity_id"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_verb"          ntext,
    "created_at"             datetime,
    "assigned_to"            ntext,
    "assigned_to_type"       ntext,
    "display_name"           ntext,
    "id"                     uniqueidentifier,
    "is_required"            bit,
    "object_type"            ntext,
    "response_comment"       ntext,
    "response_id"            uniqueidentifier,
    "started_at"             datetime,
    "status"                 ntext,
    "step"                   uniqueidentifier
);

--
-- Table: activities_submittals_target_transition_attachments
--
DROP TABLE IF EXISTS activities_submittals_target_transition_attachments;
CREATE TABLE activities_submittals_target_transition_attachments (
    "activity_id"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_verb"          ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "attachment_category"    ntext,
    "display_name"           ntext,
    "id"                     uniqueidentifier,
    "item"                   ntext,
    "object_type"            ntext,
    "resource_urns"          ntext,
    "revision"               numeric,
    "urn"                    ntext,
    "urn_type"               ntext
);

--
-- Table: activities_submittals_target_watchers
--
DROP TABLE IF EXISTS activities_submittals_target_watchers;
CREATE TABLE activities_submittals_target_watchers (
    "activity_id"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_verb"          ntext,
    "created_at"             datetime,
    "display_name"           ntext,
    "human_readable_company" ntext,
    "human_readable_name"    ntext,
    "id"                     ntext,
    "object_type"            ntext,
    "autodesk_id"            ntext,
    "roles"                  ntext
);

-- =================================================================
-- # Schema: admin
-- =================================================================
--
-- Table: admin_account_services
--
DROP TABLE IF EXISTS admin_account_services;
CREATE TABLE admin_account_services (
    "bim360_account_id"      uniqueidentifier,
    "service"                ntext
);

--
-- Table: admin_accounts
--
DROP TABLE IF EXISTS admin_accounts;
CREATE TABLE admin_accounts (
    "bim360_account_id"      uniqueidentifier,
    "display_name"           ntext,
    "start_date"             datetime,
    "end_date"               datetime
);

--
-- Table: admin_business_units
--
DROP TABLE IF EXISTS admin_business_units;
CREATE TABLE admin_business_units (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "parent_id"              uniqueidentifier,
    "name"                   ntext,
    "description"            ntext,
    "path"                   ntext
);

--
-- Table: admin_companies
--
DROP TABLE IF EXISTS admin_companies;
CREATE TABLE admin_companies (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "name"                   ntext,
    "trade"                  ntext,
    "category"               ntext,
    "address_line1"          ntext,
    "address_line2"          ntext,
    "city"                   ntext,
    "state_or_province"      ntext,
    "postal_code"            ntext,
    "country"                ntext,
    "phone"                  ntext,
    "website_url"            ntext,
    "description"            ntext,
    "erp_id"                 ntext,
    "tax_id"                 ntext,
    "status"                 ntext,
    "created_at"             datetime,
    "project_size"           numeric,
    "user_size"              numeric,
    "custom_properties"      ntext
);

--
-- Table: admin_project_companies
--
DROP TABLE IF EXISTS admin_project_companies;
CREATE TABLE admin_project_companies (
    "project_id"             uniqueidentifier,
    "company_id"             uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "company_oxygen_id"      ntext
);

--
-- Table: admin_project_products
--
DROP TABLE IF EXISTS admin_project_products;
CREATE TABLE admin_project_products (
    "bim360_project_id"      uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "product_key"            ntext,
    "status"                 ntext,
    "created_at"             datetime
);

--
-- Table: admin_project_roles
--
DROP TABLE IF EXISTS admin_project_roles;
CREATE TABLE admin_project_roles (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "role_oxygen_id"         ntext,
    "name"                   ntext,
    "status"                 ntext,
    "role_id"                uniqueidentifier
);

--
-- Table: admin_project_services
--
DROP TABLE IF EXISTS admin_project_services;
CREATE TABLE admin_project_services (
    "project_id"             uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "service"                ntext,
    "status"                 ntext,
    "created_at"             datetime
);

--
-- Table: admin_project_user_companies
--
DROP TABLE IF EXISTS admin_project_user_companies;
CREATE TABLE admin_project_user_companies (
    "bim360_account_id"      uniqueidentifier,
    "company_oxygen_id"      uniqueidentifier,
    "project_id"             uniqueidentifier,
    "user_id"                uniqueidentifier
);

--
-- Table: admin_project_user_products
--
DROP TABLE IF EXISTS admin_project_user_products;
CREATE TABLE admin_project_user_products (
    "bim360_project_id"      uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "user_id"                uniqueidentifier,
    "product_key"            ntext,
    "access_level"           ntext,
    "created_at"             datetime
);

--
-- Table: admin_project_user_roles
--
DROP TABLE IF EXISTS admin_project_user_roles;
CREATE TABLE admin_project_user_roles (
    "project_id"             uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "user_id"                uniqueidentifier,
    "role_id"                uniqueidentifier,
    "created_at"             datetime
);

--
-- Table: admin_project_user_services
--
DROP TABLE IF EXISTS admin_project_user_services;
CREATE TABLE admin_project_user_services (
    "project_id"             uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "user_id"                uniqueidentifier,
    "service"                ntext,
    "role"                   ntext,
    "created_at"             datetime
);

--
-- Table: admin_project_users
--
DROP TABLE IF EXISTS admin_project_users;
CREATE TABLE admin_project_users (
    "bim360_project_id"      uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "user_id"                uniqueidentifier,
    "status"                 ntext,
    "company_id"             uniqueidentifier,
    "access_level"           ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: admin_projects
--
DROP TABLE IF EXISTS admin_projects;
CREATE TABLE admin_projects (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "name"                   ntext,
    "start_date"             datetime,
    "end_date"               datetime,
    "type"                   ntext,
    "value"                  numeric,
    "currency"               ntext,
    "status"                 ntext,
    "job_number"             ntext,
    "address_line1"          ntext,
    "address_line2"          ntext,
    "city"                   ntext,
    "state_or_province"      ntext,
    "postal_code"            ntext,
    "country"                ntext,
    "timezone"               ntext,
    "construction_type"      ntext,
    "contract_type"          ntext,
    "business_unit_id"       uniqueidentifier,
    "last_sign_in"           datetime,
    "created_at"             datetime,
    "acc_project"            bit,
    "latitude"               numeric,
    "longitude"              numeric,
    "updated_at"             datetime,
    "status_reason"          ntext,
    "total_member_size"      numeric,
    "total_company_size"     numeric,
    "classification"         ntext
);

--
-- Table: admin_roles
--
DROP TABLE IF EXISTS admin_roles;
CREATE TABLE admin_roles (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "name"                   ntext,
    "status"                 ntext
);

--
-- Table: admin_users
--
DROP TABLE IF EXISTS admin_users;
CREATE TABLE admin_users (
    "id"                     uniqueidentifier,
    "autodesk_id"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "email"                  ntext,
    "name"                   ntext,
    "first_name"             ntext,
    "last_name"              ntext,
    "address_line1"          ntext,
    "address_line2"          ntext,
    "city"                   ntext,
    "state_or_province"      ntext,
    "postal_code"            ntext,
    "country"                ntext,
    "last_sign_in"           datetime,
    "phone"                  ntext,
    "job_title"              ntext,
    "access_level_account_admin" bit,
    "access_level_project_admin" bit,
    "access_level_project_member" bit,
    "access_level_executive" bit,
    "default_role_id"        uniqueidentifier,
    "default_company_id"     uniqueidentifier,
    "status"                 ntext,
    "status_reason"          ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

-- =================================================================
-- # Schema: assets
-- =================================================================
--
-- Table: assets_asset_custom_attribute_values
--
DROP TABLE IF EXISTS assets_asset_custom_attribute_values;
CREATE TABLE assets_asset_custom_attribute_values (
    "asset_id"               uniqueidentifier,
    "custom_attribute_id"    uniqueidentifier,
    "value_boolean"          bit,
    "value_string"           ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier
);

--
-- Table: assets_asset_model_sync_records
--
DROP TABLE IF EXISTS assets_asset_model_sync_records;
CREATE TABLE assets_asset_model_sync_records (
    "id"                     uniqueidentifier,
    "version"                numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "asset_id"               uniqueidentifier,
    "model_lineage_urn"      ntext,
    "model_object_guid"      ntext,
    "model_external_id"      ntext,
    "synced_model_version_urn" ntext,
    "synced_model_version_number" numeric,
    "model_svf2_id"          numeric,
    "model_lmv_id"           numeric,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "deleted_at"             datetime,
    "deleted_by"             ntext
);

--
-- Table: assets_asset_permissions
--
DROP TABLE IF EXISTS assets_asset_permissions;
CREATE TABLE assets_asset_permissions (
    "id"                     uniqueidentifier,
    "version"                numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "permission_policy_type" ntext,
    "subject_type"           ntext,
    "subject_oxygen_id"      ntext,
    "subject_acs_admin_id"   uniqueidentifier,
    "resource_type"          ntext,
    "resource_id"            uniqueidentifier,
    "effect"                 ntext,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "deleted_at"             datetime,
    "deleted_by"             ntext
);

--
-- Table: assets_asset_stages
--
DROP TABLE IF EXISTS assets_asset_stages;
CREATE TABLE assets_asset_stages (
    "id"                     uniqueidentifier,
    "version"                numeric,
    "asset_id"               uniqueidentifier,
    "bound_type"             ntext,
    "bound_id"               uniqueidentifier,
    "completed_work"         numeric,
    "max_work"               numeric,
    "unit_of_work"           ntext,
    "started_at"             datetime,
    "started_by"             ntext,
    "completed_at"           datetime,
    "completed_by"           ntext,
    "completion_status"      ntext,
    "is_current"             bit,
    "category_id"            uniqueidentifier,
    "location_id"            uniqueidentifier,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "deleted_at"             datetime,
    "deleted_by"             ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier
);

--
-- Table: assets_asset_statuses
--
DROP TABLE IF EXISTS assets_asset_statuses;
CREATE TABLE assets_asset_statuses (
    "id"                     uniqueidentifier,
    "version"                numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "label"                  ntext,
    "description"            ntext,
    "status_set_id"          uniqueidentifier,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "deleted_at"             datetime,
    "deleted_by"             ntext,
    "sort_order"             numeric
);

--
-- Table: assets_assets
--
DROP TABLE IF EXISTS assets_assets;
CREATE TABLE assets_assets (
    "id"                     uniqueidentifier,
    "version"                numeric,
    "client_asset_id"        ntext,
    "description"            ntext,
    "category_id"            ntext,
    "status_id"              uniqueidentifier,
    "location_id"            uniqueidentifier,
    "company_id"             uniqueidentifier,
    "barcode"                ntext,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "deleted_at"             datetime,
    "deleted_by"             ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier
);

--
-- Table: assets_categories
--
DROP TABLE IF EXISTS assets_categories;
CREATE TABLE assets_categories (
    "id"                     ntext,
    "version"                numeric,
    "name"                   ntext,
    "description"            ntext,
    "parent_id"              ntext,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "deleted_at"             datetime,
    "deleted_by"             ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "uid"                    uniqueidentifier,
    "category_type"          ntext,
    "parent_uid"             uniqueidentifier
);

--
-- Table: assets_category_custom_attribute_assignments
--
DROP TABLE IF EXISTS assets_category_custom_attribute_assignments;
CREATE TABLE assets_category_custom_attribute_assignments (
    "id"                     uniqueidentifier,
    "version"                numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "category_id"            ntext,
    "custom_attribute_id"    uniqueidentifier,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "deleted_at"             datetime,
    "deleted_by"             ntext
);

--
-- Table: assets_category_status_set_assignments
--
DROP TABLE IF EXISTS assets_category_status_set_assignments;
CREATE TABLE assets_category_status_set_assignments (
    "id"                     uniqueidentifier,
    "version"                numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "category_id"            ntext,
    "status_set_id"          uniqueidentifier,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "deleted_at"             datetime,
    "deleted_by"             ntext,
    "category_type"          ntext,
    "category_uid"           uniqueidentifier
);

--
-- Table: assets_custom_attribute_default_values
--
DROP TABLE IF EXISTS assets_custom_attribute_default_values;
CREATE TABLE assets_custom_attribute_default_values (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "custom_attribute_id"    uniqueidentifier,
    "default_value_boolean"  bit,
    "default_value_string"   ntext
);

--
-- Table: assets_custom_attribute_selection_values
--
DROP TABLE IF EXISTS assets_custom_attribute_selection_values;
CREATE TABLE assets_custom_attribute_selection_values (
    "id"                     uniqueidentifier,
    "version"                numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "display_name"           ntext,
    "custom_attribute_id"    uniqueidentifier,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "deleted_at"             datetime,
    "deleted_by"             ntext
);

--
-- Table: assets_custom_attributes
--
DROP TABLE IF EXISTS assets_custom_attributes;
CREATE TABLE assets_custom_attributes (
    "id"                     uniqueidentifier,
    "version"                numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "display_name"           ntext,
    "description"            ntext,
    "data_type"              ntext,
    "required_on_ingress"    bit,
    "max_length_on_ingress"  numeric,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "deleted_at"             datetime,
    "deleted_by"             ntext
);

--
-- Table: assets_model_sync_containers
--
DROP TABLE IF EXISTS assets_model_sync_containers;
CREATE TABLE assets_model_sync_containers (
    "id"                     uniqueidentifier,
    "version"                numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "model_lineage_urn"      ntext,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "deleted_at"             datetime,
    "deleted_by"             ntext
);

--
-- Table: assets_status_sets
--
DROP TABLE IF EXISTS assets_status_sets;
CREATE TABLE assets_status_sets (
    "id"                     uniqueidentifier,
    "version"                numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "description"            ntext,
    "is_default"             bit,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "deleted_at"             datetime,
    "deleted_by"             ntext
);

--
-- Table: assets_system_memberships
--
DROP TABLE IF EXISTS assets_system_memberships;
CREATE TABLE assets_system_memberships (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "system_id"              uniqueidentifier,
    "member_type"            ntext,
    "member_id"              uniqueidentifier
);

--
-- Table: assets_systems
--
DROP TABLE IF EXISTS assets_systems;
CREATE TABLE assets_systems (
    "id"                     uniqueidentifier,
    "version"                numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "description"            ntext,
    "category_uid"           uniqueidentifier,
    "status_id"              uniqueidentifier,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "deleted_at"             datetime,
    "deleted_by"             ntext
);

-- =================================================================
-- # Schema: cdcadmin
-- =================================================================
--
-- Table: cdcadmin_account_services
--
DROP TABLE IF EXISTS cdcadmin_account_services;
CREATE TABLE cdcadmin_account_services (
    "bim360_account_id"      uniqueidentifier,
    "service"                ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcadmin_accounts
--
DROP TABLE IF EXISTS cdcadmin_accounts;
CREATE TABLE cdcadmin_accounts (
    "bim360_account_id"      uniqueidentifier,
    "display_name"           ntext,
    "start_date"             datetime,
    "end_date"               datetime,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcadmin_companies
--
DROP TABLE IF EXISTS cdcadmin_companies;
CREATE TABLE cdcadmin_companies (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "name"                   ntext,
    "trade"                  ntext,
    "category"               ntext,
    "address_line1"          ntext,
    "address_line2"          ntext,
    "city"                   ntext,
    "state_or_province"      ntext,
    "postal_code"            ntext,
    "country"                ntext,
    "phone"                  ntext,
    "website_url"            ntext,
    "description"            ntext,
    "erp_id"                 ntext,
    "tax_id"                 ntext,
    "status"                 ntext,
    "created_at"             datetime,
    "project_size"           numeric,
    "user_size"              numeric,
    "custom_properties"      ntext,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcadmin_project_companies
--
DROP TABLE IF EXISTS cdcadmin_project_companies;
CREATE TABLE cdcadmin_project_companies (
    "project_id"             uniqueidentifier,
    "company_id"             uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "company_oxygen_id"      ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcadmin_project_products
--
DROP TABLE IF EXISTS cdcadmin_project_products;
CREATE TABLE cdcadmin_project_products (
    "bim360_project_id"      uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "product_key"            ntext,
    "status"                 ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcadmin_project_roles
--
DROP TABLE IF EXISTS cdcadmin_project_roles;
CREATE TABLE cdcadmin_project_roles (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "role_oxygen_id"         ntext,
    "name"                   ntext,
    "status"                 ntext,
    "role_id"                uniqueidentifier,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcadmin_project_services
--
DROP TABLE IF EXISTS cdcadmin_project_services;
CREATE TABLE cdcadmin_project_services (
    "project_id"             uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "service"                ntext,
    "status"                 ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcadmin_project_user_companies
--
DROP TABLE IF EXISTS cdcadmin_project_user_companies;
CREATE TABLE cdcadmin_project_user_companies (
    "bim360_account_id"      uniqueidentifier,
    "company_oxygen_id"      uniqueidentifier,
    "project_id"             uniqueidentifier,
    "user_id"                uniqueidentifier,
    "status"                 ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcadmin_project_user_roles
--
DROP TABLE IF EXISTS cdcadmin_project_user_roles;
CREATE TABLE cdcadmin_project_user_roles (
    "project_id"             uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "user_id"                uniqueidentifier,
    "role_id"                uniqueidentifier,
    "created_at"             datetime,
    "bim360_project_id"      uniqueidentifier,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcadmin_project_users
--
DROP TABLE IF EXISTS cdcadmin_project_users;
CREATE TABLE cdcadmin_project_users (
    "bim360_project_id"      uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "user_id"                uniqueidentifier,
    "status"                 ntext,
    "company_id"             uniqueidentifier,
    "access_level"           ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcadmin_projects
--
DROP TABLE IF EXISTS cdcadmin_projects;
CREATE TABLE cdcadmin_projects (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "name"                   ntext,
    "start_date"             datetime,
    "end_date"               datetime,
    "type"                   ntext,
    "value"                  numeric,
    "currency"               ntext,
    "status"                 ntext,
    "job_number"             ntext,
    "address_line1"          ntext,
    "address_line2"          ntext,
    "city"                   ntext,
    "state_or_province"      ntext,
    "postal_code"            ntext,
    "country"                ntext,
    "timezone"               ntext,
    "construction_type"      ntext,
    "contract_type"          ntext,
    "business_unit_id"       uniqueidentifier,
    "last_sign_in"           datetime,
    "created_at"             datetime,
    "acc_project"            bit,
    "latitude"               numeric,
    "longitude"              numeric,
    "updated_at"             datetime,
    "status_reason"          ntext,
    "total_member_size"      numeric,
    "total_company_size"     numeric,
    "classification"         ntext,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcadmin_roles
--
DROP TABLE IF EXISTS cdcadmin_roles;
CREATE TABLE cdcadmin_roles (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "name"                   ntext,
    "status"                 ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcadmin_users
--
DROP TABLE IF EXISTS cdcadmin_users;
CREATE TABLE cdcadmin_users (
    "id"                     uniqueidentifier,
    "autodesk_id"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "email"                  ntext,
    "name"                   ntext,
    "first_name"             ntext,
    "last_name"              ntext,
    "address_line1"          ntext,
    "address_line2"          ntext,
    "city"                   ntext,
    "state_or_province"      ntext,
    "postal_code"            ntext,
    "country"                ntext,
    "last_sign_in"           datetime,
    "phone"                  ntext,
    "job_title"              ntext,
    "access_level_account_admin" bit,
    "access_level_project_admin" bit,
    "access_level_project_member" bit,
    "access_level_executive" bit,
    "default_role_id"        uniqueidentifier,
    "default_company_id"     uniqueidentifier,
    "status"                 ntext,
    "status_reason"          ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

-- =================================================================
-- # Schema: cdccost
-- =================================================================
--
-- Table: cdccost_approval_workflows
--
DROP TABLE IF EXISTS cdccost_approval_workflows;
CREATE TABLE cdccost_approval_workflows (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "association_id"         uniqueidentifier,
    "association_type"       ntext,
    "current_step_name"      ntext,
    "current_assigned_users" ntext,
    "current_assigned_groups" ntext,
    "reviewed_users"         ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "current_due_date"       datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_budget_code_segment_codes
--
DROP TABLE IF EXISTS cdccost_budget_code_segment_codes;
CREATE TABLE cdccost_budget_code_segment_codes (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "parent_id"              uniqueidentifier,
    "segment_id"             uniqueidentifier,
    "code"                   ntext,
    "original_code"          ntext,
    "description"            ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_budget_code_segments
--
DROP TABLE IF EXISTS cdccost_budget_code_segments;
CREATE TABLE cdccost_budget_code_segments (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "length"                 numeric,
    "position"               numeric,
    "type"                   ntext,
    "delimiter"              ntext,
    "sample_code"            ntext,
    "is_variable_length"     bit,
    "is_locked"              bit,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_budget_payment_items
--
DROP TABLE IF EXISTS cdccost_budget_payment_items;
CREATE TABLE cdccost_budget_payment_items (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "payment_id"             uniqueidentifier,
    "parent_id"              uniqueidentifier,
    "number"                 ntext,
    "name"                   ntext,
    "description"            ntext,
    "unit"                   ntext,
    "original_amount"        numeric,
    "original_qty"           numeric,
    "original_unit_price"    numeric,
    "amount"                 numeric,
    "unit_price"             numeric,
    "qty"                    numeric,
    "materials_on_store"     numeric,
    "materials_on_store_qty" numeric,
    "materials_on_store_unit_price" numeric,
    "previous_amount"        numeric,
    "previous_qty"           numeric,
    "previous_unit_price"    numeric,
    "previous_materials_on_store" numeric,
    "completed_work_retention_percent" numeric,
    "materials_on_store_retention_percent" numeric,
    "completed_work_released" numeric,
    "materials_on_store_released" numeric,
    "net_amount"             numeric,
    "status"                 ntext,
    "creator_id"             ntext,
    "changed_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_budget_payment_properties
--
DROP TABLE IF EXISTS cdccost_budget_payment_properties;
CREATE TABLE cdccost_budget_payment_properties (
    "budget_payment_id"      uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "built_in"               bit,
    "position"               numeric,
    "property_definition_id" uniqueidentifier,
    "type"                   ntext,
    "value"                  ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_budget_payments
--
DROP TABLE IF EXISTS cdccost_budget_payments;
CREATE TABLE cdccost_budget_payments (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "main_contract_id"       uniqueidentifier,
    "start_date"             datetime,
    "end_date"               datetime,
    "due_date"               datetime,
    "number"                 ntext,
    "name"                   ntext,
    "description"            ntext,
    "original_amount"        numeric,
    "amount"                 numeric,
    "previous_amount"        numeric,
    "materials_on_store"     numeric,
    "previous_materials_on_store" numeric,
    "approved_change_orders" numeric,
    "contract_amount"        numeric,
    "completed_work_retention" numeric,
    "materials_on_store_retention" numeric,
    "net_amount"             numeric,
    "paid_amount"            numeric,
    "status"                 ntext,
    "company_id"             ntext,
    "payment_type"           ntext,
    "payment_reference"      ntext,
    "creator_id"             ntext,
    "changed_by"             ntext,
    "contact_id"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "approved_at"            datetime,
    "paid_at"                datetime,
    "submitted_at"           datetime,
    "note"                   ntext,
    "materials_billed"       numeric,
    "materials_retention"    numeric,
    "integration_state"      ntext,
    "integration_state_changed_by" ntext,
    "integration_state_changed_at" datetime,
    "external_id"            ntext,
    "external_system"        ntext,
    "message"                ntext,
    "last_sync_time"         datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_budget_properties
--
DROP TABLE IF EXISTS cdccost_budget_properties;
CREATE TABLE cdccost_budget_properties (
    "budget_id"              uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "built_in"               bit,
    "position"               numeric,
    "property_definition_id" uniqueidentifier,
    "type"                   ntext,
    "value"                  ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_budget_transfers
--
DROP TABLE IF EXISTS cdccost_budget_transfers;
CREATE TABLE cdccost_budget_transfers (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "number"                 ntext,
    "name"                   ntext,
    "note"                   ntext,
    "status"                 ntext,
    "approved_at"            datetime,
    "creator_id"             ntext,
    "changed_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "integration_state"      ntext,
    "integration_state_changed_by" ntext,
    "integration_state_changed_at" datetime,
    "external_id"            ntext,
    "external_system"        ntext,
    "message"                ntext,
    "last_sync_time"         datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_budgets
--
DROP TABLE IF EXISTS cdccost_budgets;
CREATE TABLE cdccost_budgets (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "parent_id"              uniqueidentifier,
    "code"                   ntext,
    "name"                   ntext,
    "description"            ntext,
    "quantity"               numeric,
    "unit_price"             numeric,
    "unit"                   ntext,
    "original_amount"        numeric,
    "internal_adjustment"    numeric,
    "approved_owner_changes" numeric,
    "pending_owner_changes"  numeric,
    "original_commitment"    numeric,
    "approved_change_orders" numeric,
    "approved_in_scope_change_orders" numeric,
    "pending_change_orders"  numeric,
    "reserves"               numeric,
    "actual_cost"            numeric,
    "main_contract_id"       uniqueidentifier,
    "contract_id"            uniqueidentifier,
    "adjustments_total"      numeric,
    "uncommitted"            numeric,
    "revised"                numeric,
    "projected_cost"         numeric,
    "projected_budget"       numeric,
    "forecast_final_cost"    numeric,
    "forecast_variance"      numeric,
    "forecast_cost_complete" numeric,
    "variance_total"         numeric,
    "created_at"             datetime,
    "updated_at"             datetime,
    "original_contracted"    numeric,
    "compounded"             ntext,
    "integration_state"      ntext,
    "integration_state_changed_by" ntext,
    "integration_state_changed_at" datetime,
    "external_id"            ntext,
    "external_system"        ntext,
    "message"                ntext,
    "last_sync_time"         datetime,
    "pending_internal_budget_transfer" numeric,
    "pending_internal_budget_transfer_qty" numeric,
    "pending_internal_budget_transfer_input_qty" numeric,
    "code_segment_values"    ntext,
    "main_contract_item_amount" numeric,
    "approved_cost_payment_application" numeric,
    "approved_budget_payment_application" numeric,
    "locations"              ntext,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_change_order_cost_items
--
DROP TABLE IF EXISTS cdccost_change_order_cost_items;
CREATE TABLE cdccost_change_order_cost_items (
    "change_order_id"        uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "cost_item_id"           uniqueidentifier,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_change_order_properties
--
DROP TABLE IF EXISTS cdccost_change_order_properties;
CREATE TABLE cdccost_change_order_properties (
    "change_order_id"        uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "built_in"               bit,
    "position"               numeric,
    "property_definition_id" uniqueidentifier,
    "type"                   ntext,
    "value"                  ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_change_orders
--
DROP TABLE IF EXISTS cdccost_change_orders;
CREATE TABLE cdccost_change_orders (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "number"                 ntext,
    "name"                   ntext,
    "description"            ntext,
    "creator_id"             ntext,
    "owner_id"               ntext,
    "changed_by"             ntext,
    "contract_id"            uniqueidentifier,
    "form_type"              ntext,
    "markup_formula_id"      uniqueidentifier,
    "applied_by"             ntext,
    "applied_at"             datetime,
    "budget_status"          ntext,
    "cost_status"            ntext,
    "scope_of_work"          ntext,
    "note"                   ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "type"                   ntext,
    "schedule_change"        numeric,
    "integration_state"      ntext,
    "integration_state_changed_by" ntext,
    "integration_state_changed_at" datetime,
    "external_id"            ntext,
    "external_system"        ntext,
    "message"                ntext,
    "last_sync_time"         datetime,
    "proposed_revised_completion_date" datetime,
    "source_type"            ntext,
    "approved_at"            datetime,
    "status_changed_at"      datetime,
    "main_contract_id"       uniqueidentifier,
    "quantity"               numeric,
    "unit"                   ntext,
    "estimated"              numeric,
    "proposed"               numeric,
    "submitted"              numeric,
    "approved"               numeric,
    "committed"              numeric,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_contract_properties
--
DROP TABLE IF EXISTS cdccost_contract_properties;
CREATE TABLE cdccost_contract_properties (
    "contract_id"            uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "built_in"               bit,
    "position"               numeric,
    "property_definition_id" uniqueidentifier,
    "type"                   ntext,
    "value"                  ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_contracts
--
DROP TABLE IF EXISTS cdccost_contracts;
CREATE TABLE cdccost_contracts (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "code"                   ntext,
    "name"                   ntext,
    "description"            ntext,
    "company_id"             ntext,
    "type"                   ntext,
    "contact_id"             ntext,
    "creator_id"             ntext,
    "signed_by"              ntext,
    "owner_id"               ntext,
    "changed_by"             ntext,
    "status"                 ntext,
    "awarded"                numeric,
    "original_budget"        numeric,
    "internal_adjustment"    numeric,
    "approved_owner_changes" numeric,
    "pending_owner_changes"  numeric,
    "approved_change_orders" numeric,
    "approved_in_scope_change_orders" numeric,
    "pending_change_orders"  numeric,
    "reserves"               numeric,
    "actual_cost"            numeric,
    "uncommitted"            numeric,
    "revised"                numeric,
    "projected_cost"         numeric,
    "projected_budget"       numeric,
    "forecast_final_cost"    numeric,
    "forecast_variance"      numeric,
    "forecast_cost_complete" numeric,
    "variance_total"         numeric,
    "awarded_at"             datetime,
    "status_changed_at"      datetime,
    "sent_at"                datetime,
    "responded_at"           datetime,
    "returned_at"            datetime,
    "onsite_at"              datetime,
    "offsite_at"             datetime,
    "procured_at"            datetime,
    "approved_at"            datetime,
    "created_at"             datetime,
    "updated_at"             datetime,
    "scope_of_work"          ntext,
    "note"                   ntext,
    "adjustments_total"      numeric,
    "executed_at"            datetime,
    "currency"               ntext,
    "exchange_rate"          numeric,
    "integration_state"      ntext,
    "integration_state_changed_by" ntext,
    "integration_state_changed_at" datetime,
    "external_id"            ntext,
    "external_system"        ntext,
    "message"                ntext,
    "last_sync_time"         datetime,
    "pending_internal_budget_transfer" numeric,
    "compliance_status"      ntext,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext,
    "awarded_tax_total"      numeric
);

--
-- Table: cdccost_cost_item_properties
--
DROP TABLE IF EXISTS cdccost_cost_item_properties;
CREATE TABLE cdccost_cost_item_properties (
    "cost_item_id"           uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "built_in"               bit,
    "position"               numeric,
    "property_definition_id" uniqueidentifier,
    "type"                   ntext,
    "value"                  ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_cost_items
--
DROP TABLE IF EXISTS cdccost_cost_items;
CREATE TABLE cdccost_cost_items (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "number"                 ntext,
    "name"                   ntext,
    "description"            ntext,
    "budget_id"              uniqueidentifier,
    "budget_status"          ntext,
    "cost_status"            ntext,
    "scope"                  ntext,
    "type"                   ntext,
    "estimated"              numeric,
    "proposed"               numeric,
    "submitted"              numeric,
    "approved"               numeric,
    "committed"              numeric,
    "scope_of_work"          ntext,
    "note"                   ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "schedule_change"        numeric,
    "approved_tax_summary"   ntext,
    "committed_tax_summary"  ntext,
    "estimated_tax_summary"  ntext,
    "proposed_tax_summary"   ntext,
    "submitted_tax_summary"  ntext,
    "is_markup"              bit,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_cost_payment_items
--
DROP TABLE IF EXISTS cdccost_cost_payment_items;
CREATE TABLE cdccost_cost_payment_items (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "payment_id"             uniqueidentifier,
    "parent_id"              uniqueidentifier,
    "number"                 ntext,
    "name"                   ntext,
    "description"            ntext,
    "unit"                   ntext,
    "original_amount"        numeric,
    "original_qty"           numeric,
    "original_unit_price"    numeric,
    "amount"                 numeric,
    "unit_price"             numeric,
    "qty"                    numeric,
    "materials_on_store"     numeric,
    "materials_on_store_qty" numeric,
    "materials_on_store_unit_price" numeric,
    "previous_amount"        numeric,
    "previous_qty"           numeric,
    "previous_unit_price"    numeric,
    "previous_materials_on_store" numeric,
    "completed_work_retention_percent" numeric,
    "materials_on_store_retention_percent" numeric,
    "completed_work_released" numeric,
    "materials_on_store_released" numeric,
    "net_amount"             numeric,
    "status"                 ntext,
    "creator_id"             ntext,
    "changed_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "tax_summary"            ntext,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_cost_payment_properties
--
DROP TABLE IF EXISTS cdccost_cost_payment_properties;
CREATE TABLE cdccost_cost_payment_properties (
    "cost_payment_id"        uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "built_in"               bit,
    "position"               numeric,
    "property_definition_id" uniqueidentifier,
    "type"                   ntext,
    "value"                  ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_cost_payments
--
DROP TABLE IF EXISTS cdccost_cost_payments;
CREATE TABLE cdccost_cost_payments (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "contract_id"            uniqueidentifier,
    "start_date"             datetime,
    "end_date"               datetime,
    "due_date"               datetime,
    "number"                 ntext,
    "name"                   ntext,
    "description"            ntext,
    "original_amount"        numeric,
    "amount"                 numeric,
    "previous_amount"        numeric,
    "materials_on_store"     numeric,
    "previous_materials_on_store" numeric,
    "approved_change_orders" numeric,
    "contract_amount"        numeric,
    "completed_work_retention" numeric,
    "materials_on_store_retention" numeric,
    "net_amount"             numeric,
    "paid_amount"            numeric,
    "status"                 ntext,
    "company_id"             ntext,
    "payment_type"           ntext,
    "payment_reference"      ntext,
    "creator_id"             ntext,
    "changed_by"             ntext,
    "contact_id"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "approved_at"            datetime,
    "paid_at"                datetime,
    "submitted_at"           datetime,
    "note"                   ntext,
    "materials_billed"       numeric,
    "materials_retention"    numeric,
    "integration_state"      ntext,
    "integration_state_changed_by" ntext,
    "integration_state_changed_at" datetime,
    "external_id"            ntext,
    "external_system"        ntext,
    "message"                ntext,
    "last_sync_time"         datetime,
    "tax_summary"            ntext,
    "compliance_status"      ntext,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_distribution_item_curves
--
DROP TABLE IF EXISTS cdccost_distribution_item_curves;
CREATE TABLE cdccost_distribution_item_curves (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "distribution_item_id"   uniqueidentifier,
    "actual_total"           numeric,
    "distribution_total"     numeric,
    "curve"                  ntext,
    "periods"                ntext,
    "actual_total_input_qty" numeric,
    "distribution_total_input_qty" numeric,
    "periods_input_qty"      ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_distribution_items
--
DROP TABLE IF EXISTS cdccost_distribution_items;
CREATE TABLE cdccost_distribution_items (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "budget_id"              ntext,
    "association_id"         uniqueidentifier,
    "association_type"       ntext,
    "number"                 ntext,
    "name"                   ntext,
    "status"                 ntext,
    "due_date"               datetime,
    "company_id"             uniqueidentifier,
    "contact_id"             ntext,
    "creator_id"             ntext,
    "changed_by"             ntext,
    "submitted_at"           datetime,
    "accepted_at"            datetime,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_expense_items
--
DROP TABLE IF EXISTS cdccost_expense_items;
CREATE TABLE cdccost_expense_items (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "expense_id"             uniqueidentifier,
    "budget_id"              uniqueidentifier,
    "contract_id"            uniqueidentifier,
    "number"                 ntext,
    "name"                   ntext,
    "description"            ntext,
    "unit"                   ntext,
    "unit_price"             numeric,
    "quantity"               numeric,
    "amount"                 numeric,
    "tax"                    numeric,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_expense_properties
--
DROP TABLE IF EXISTS cdccost_expense_properties;
CREATE TABLE cdccost_expense_properties (
    "expense_id"             uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "built_in"               bit,
    "position"               numeric,
    "property_definition_id" uniqueidentifier,
    "type"                   ntext,
    "value"                  ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_expenses
--
DROP TABLE IF EXISTS cdccost_expenses;
CREATE TABLE cdccost_expenses (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "number"                 ntext,
    "name"                   ntext,
    "description"            ntext,
    "creator_id"             ntext,
    "changed_by"             ntext,
    "supplier_id"            ntext,
    "supplier_name"          ntext,
    "amount"                 numeric,
    "paid_amount"            numeric,
    "status"                 ntext,
    "type"                   ntext,
    "payment_type"           ntext,
    "payment_reference"      ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "issued_at"              datetime,
    "received_at"            datetime,
    "approved_at"            datetime,
    "paid_at"                datetime,
    "reference_number"       ntext,
    "integration_state"      ntext,
    "integration_state_changed_by" ntext,
    "integration_state_changed_at" datetime,
    "external_id"            ntext,
    "external_system"        ntext,
    "message"                ntext,
    "last_sync_time"         datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_main_contract_items
--
DROP TABLE IF EXISTS cdccost_main_contract_items;
CREATE TABLE cdccost_main_contract_items (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "main_contract_id"       uniqueidentifier,
    "budget_id"              uniqueidentifier,
    "parent_id"              uniqueidentifier,
    "code"                   ntext,
    "name"                   ntext,
    "description"            ntext,
    "qty"                    numeric,
    "unit_price"             numeric,
    "unit"                   ntext,
    "amount"                 numeric,
    "changed_by"             ntext,
    "is_private"             bit,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_main_contract_properties
--
DROP TABLE IF EXISTS cdccost_main_contract_properties;
CREATE TABLE cdccost_main_contract_properties (
    "main_contract_id"       uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "built_in"               bit,
    "position"               numeric,
    "property_definition_id" uniqueidentifier,
    "type"                   ntext,
    "value"                  ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_main_contracts
--
DROP TABLE IF EXISTS cdccost_main_contracts;
CREATE TABLE cdccost_main_contracts (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "code"                   ntext,
    "name"                   ntext,
    "description"            ntext,
    "type"                   ntext,
    "status"                 ntext,
    "amount"                 numeric,
    "retention_cap"          numeric,
    "contact_id"             ntext,
    "creator_id"             ntext,
    "owner_id"               ntext,
    "changed_by"             ntext,
    "scope_of_work"          ntext,
    "note"                   ntext,
    "start_date"             datetime,
    "executed_date"          datetime,
    "planned_completion_date" datetime,
    "actual_completion_date" datetime,
    "close_date"             datetime,
    "created_at"             datetime,
    "updated_at"             datetime,
    "revised_completion_date" datetime,
    "schedule_change"        numeric,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_payment_references
--
DROP TABLE IF EXISTS cdccost_payment_references;
CREATE TABLE cdccost_payment_references (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "amount"                 numeric,
    "type"                   ntext,
    "reference"              ntext,
    "paid_at"                datetime,
    "association_id"         uniqueidentifier,
    "association_type"       ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_permissions
--
DROP TABLE IF EXISTS cdccost_permissions;
CREATE TABLE cdccost_permissions (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "policy_id"              uniqueidentifier,
    "subject_id"             ntext,
    "subject_type"           ntext,
    "permission_level"       ntext,
    "resource_type"          ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_schedule_of_values_properties
--
DROP TABLE IF EXISTS cdccost_schedule_of_values_properties;
CREATE TABLE cdccost_schedule_of_values_properties (
    "schedule_of_value_id"   uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "built_in"               bit,
    "position"               numeric,
    "property_definition_id" uniqueidentifier,
    "type"                   ntext,
    "value"                  ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_sub_distribution_items
--
DROP TABLE IF EXISTS cdccost_sub_distribution_items;
CREATE TABLE cdccost_sub_distribution_items (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "distribution_item_id"   uniqueidentifier,
    "association_id"         ntext,
    "association_type"       ntext,
    "number"                 ntext,
    "name"                   ntext,
    "start_date"             date,
    "end_date"               date,
    "actual_total"           numeric,
    "distribution_total"     numeric,
    "type"                   ntext,
    "curve"                  ntext,
    "periods"                ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "actual_total_input_qty" numeric,
    "distribution_total_input_qty" numeric,
    "periods_input_qty"      ntext,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdccost_transferences
--
DROP TABLE IF EXISTS cdccost_transferences;
CREATE TABLE cdccost_transferences (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "budget_id"              uniqueidentifier,
    "relating_budget_id"     uniqueidentifier,
    "contract_id"            uniqueidentifier,
    "relating_contract_id"   uniqueidentifier,
    "transaction_id"         uniqueidentifier,
    "amount"                 numeric,
    "unit_price"             numeric,
    "qty"                    numeric,
    "input_qty"              numeric,
    "relating_unit_price"    numeric,
    "relating_qty"           numeric,
    "relating_input_qty"     numeric,
    "creator_id"             ntext,
    "note"                   ntext,
    "main_contract_id"       uniqueidentifier,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

-- =================================================================
-- # Schema: cdciq
-- =================================================================
--
-- Table: cdciq_company_daily_quality_risk_changes
--
DROP TABLE IF EXISTS cdciq_company_daily_quality_risk_changes;
CREATE TABLE cdciq_company_daily_quality_risk_changes (
    "id"                     uniqueidentifier,
    "company_id"             uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "start_time"             datetime,
    "daily_risk"             ntext,
    "daily_risk_indicator"   numeric,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdciq_company_daily_safety_risk_changes
--
DROP TABLE IF EXISTS cdciq_company_daily_safety_risk_changes;
CREATE TABLE cdciq_company_daily_safety_risk_changes (
    "id"                     uniqueidentifier,
    "company_id"             uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "start_date"             datetime,
    "daily_safety_risk"      numeric,
    "daily_safety_risk_indicator" numeric,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdciq_cost_impact_issues
--
DROP TABLE IF EXISTS cdciq_cost_impact_issues;
CREATE TABLE cdciq_cost_impact_issues (
    "id"                     uniqueidentifier,
    "issue_updated_at"       datetime,
    "updated_at"             datetime,
    "cost_impact"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "created_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdciq_design_issues_building_components
--
DROP TABLE IF EXISTS cdciq_design_issues_building_components;
CREATE TABLE cdciq_design_issues_building_components (
    "id"                     uniqueidentifier,
    "issue_updated_at"       datetime,
    "updated_at"             datetime,
    "building_components_keywords" ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "building_components"    ntext,
    "user_building_components" ntext,
    "created_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdciq_design_issues_root_cause
--
DROP TABLE IF EXISTS cdciq_design_issues_root_cause;
CREATE TABLE cdciq_design_issues_root_cause (
    "id"                     uniqueidentifier,
    "issue_updated_at"       datetime,
    "updated_at"             datetime,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "root_causes"            ntext,
    "user_root_causes"       ntext,
    "created_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdciq_inspection_risk_issues
--
DROP TABLE IF EXISTS cdciq_inspection_risk_issues;
CREATE TABLE cdciq_inspection_risk_issues (
    "id"                     uniqueidentifier,
    "issue_updated_at"       datetime,
    "updated_at"             datetime,
    "inspection_risk"        bit,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "user_categories"        ntext,
    "created_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdciq_issues_quality_categories
--
DROP TABLE IF EXISTS cdciq_issues_quality_categories;
CREATE TABLE cdciq_issues_quality_categories (
    "id"                     uniqueidentifier,
    "updated_at"             datetime,
    "issue_updated_at"       datetime,
    "category"               ntext,
    "user_category"          ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "created_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdciq_issues_quality_risks
--
DROP TABLE IF EXISTS cdciq_issues_quality_risks;
CREATE TABLE cdciq_issues_quality_risks (
    "id"                     uniqueidentifier,
    "updated_at"             datetime,
    "risk"                   ntext,
    "issue_updated_at"       datetime,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "user_risk"              ntext,
    "created_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdciq_issues_safety_hazard
--
DROP TABLE IF EXISTS cdciq_issues_safety_hazard;
CREATE TABLE cdciq_issues_safety_hazard (
    "id"                     uniqueidentifier,
    "issue_updated_at"       datetime,
    "updated_at"             datetime,
    "safety_hazard_categories" ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "created_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdciq_issues_safety_observations
--
DROP TABLE IF EXISTS cdciq_issues_safety_observations;
CREATE TABLE cdciq_issues_safety_observations (
    "id"                     uniqueidentifier,
    "issue_updated_at"       datetime,
    "updated_at"             datetime,
    "safety_observation_category" ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "created_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdciq_issues_safety_risk
--
DROP TABLE IF EXISTS cdciq_issues_safety_risk;
CREATE TABLE cdciq_issues_safety_risk (
    "id"                     uniqueidentifier,
    "issue_updated_at"       datetime,
    "updated_at"             datetime,
    "safety_risk_category"   ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "created_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdciq_project_daily_quality_risk_changes
--
DROP TABLE IF EXISTS cdciq_project_daily_quality_risk_changes;
CREATE TABLE cdciq_project_daily_quality_risk_changes (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "start_time"             datetime,
    "daily_risk"             ntext,
    "daily_risk_indicator"   numeric,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdciq_rfis_building_components
--
DROP TABLE IF EXISTS cdciq_rfis_building_components;
CREATE TABLE cdciq_rfis_building_components (
    "id"                     uniqueidentifier,
    "rfi_updated_at"         datetime,
    "updated_at"             datetime,
    "building_components"    ntext,
    "building_components_keywords" ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "created_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdciq_rfis_disciplines
--
DROP TABLE IF EXISTS cdciq_rfis_disciplines;
CREATE TABLE cdciq_rfis_disciplines (
    "id"                     uniqueidentifier,
    "rfi_updated_at"         datetime,
    "updated_at"             datetime,
    "disciplines"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "created_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdciq_rfis_high_risk
--
DROP TABLE IF EXISTS cdciq_rfis_high_risk;
CREATE TABLE cdciq_rfis_high_risk (
    "id"                     uniqueidentifier,
    "rfi_updated_at"         datetime,
    "updated_at"             datetime,
    "risk"                   ntext,
    "score"                  numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "created_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdciq_rfis_root_cause
--
DROP TABLE IF EXISTS cdciq_rfis_root_cause;
CREATE TABLE cdciq_rfis_root_cause (
    "id"                     uniqueidentifier,
    "rfi_updated_at"         datetime,
    "updated_at"             datetime,
    "root_causes"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "created_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

-- =================================================================
-- # Schema: cdcissues
-- =================================================================
--
-- Table: cdcissues_attachments
--
DROP TABLE IF EXISTS cdcissues_attachments;
CREATE TABLE cdcissues_attachments (
    "attachment_id"          uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "issue_id"               uniqueidentifier,
    "display_name"           ntext,
    "file_name"              ntext,
    "storage_urn"            ntext,
    "file_size"              numeric,
    "file_type"              ntext,
    "lineage_urn"            ntext,
    "version"                numeric,
    "version_urn"            ntext,
    "tip_version_urn"        ntext,
    "bubble_urn"             ntext,
    "created_at"             datetime,
    "created_by"             ntext,
    "deleted_at"             datetime,
    "deleted_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "adsk_row_id"            ntext
);

--
-- Table: cdcissues_comments
--
DROP TABLE IF EXISTS cdcissues_comments;
CREATE TABLE cdcissues_comments (
    "comment_id"             uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "issue_id"               uniqueidentifier,
    "comment_body"           ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcissues_custom_attribute_list_values
--
DROP TABLE IF EXISTS cdcissues_custom_attribute_list_values;
CREATE TABLE cdcissues_custom_attribute_list_values (
    "attribute_mappings_id"  uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "list_id"                uniqueidentifier,
    "list_value"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcissues_custom_attributes
--
DROP TABLE IF EXISTS cdcissues_custom_attributes;
CREATE TABLE cdcissues_custom_attributes (
    "issue_id"               uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "mapped_item_type"       ntext,
    "attribute_mapping_id"   uniqueidentifier,
    "attribute_title"        ntext,
    "attribute_description"  ntext,
    "attribute_data_type"    ntext,
    "is_required"            bit,
    "attribute_value"        ntext,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "deleted_at"             datetime,
    "deleted_by"             ntext,
    "adsk_row_id"            ntext
);

--
-- Table: cdcissues_custom_attributes_mappings
--
DROP TABLE IF EXISTS cdcissues_custom_attributes_mappings;
CREATE TABLE cdcissues_custom_attributes_mappings (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "mapped_item_type"       ntext,
    "mapped_item_id"         uniqueidentifier,
    "title"                  ntext,
    "description"            ntext,
    "data_type"              ntext,
    "order"                  numeric,
    "is_required"            bit,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcissues_issue_subtypes
--
DROP TABLE IF EXISTS cdcissues_issue_subtypes;
CREATE TABLE cdcissues_issue_subtypes (
    "issue_subtype_id"       uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "issue_type_id"          uniqueidentifier,
    "issue_subtype"          ntext,
    "is_active"              bit,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "deleted_by"             ntext,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcissues_issue_types
--
DROP TABLE IF EXISTS cdcissues_issue_types;
CREATE TABLE cdcissues_issue_types (
    "issue_type_id"          uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "issue_type"             ntext,
    "is_active"              bit,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "deleted_by"             ntext,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcissues_issues
--
DROP TABLE IF EXISTS cdcissues_issues;
CREATE TABLE cdcissues_issues (
    "issue_id"               uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "display_id"             numeric,
    "title"                  ntext,
    "description"            ntext,
    "type_id"                uniqueidentifier,
    "subtype_id"             uniqueidentifier,
    "status"                 ntext,
    "assignee_id"            ntext,
    "assignee_type"          ntext,
    "due_date"               datetime,
    "location_id"            uniqueidentifier,
    "location_details"       ntext,
    "linked_document_urn"    ntext,
    "owner_id"               ntext,
    "root_cause_id"          uniqueidentifier,
    "root_cause_category_id" uniqueidentifier,
    "response"               ntext,
    "response_by"            ntext,
    "response_at"            datetime,
    "opened_by"              ntext,
    "opened_at"              datetime,
    "closed_by"              ntext,
    "closed_at"              datetime,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "start_date"             datetime,
    "deleted_at"             datetime,
    "snapshot_urn"           ntext,
    "published"              bit,
    "gps_coordinates"        ntext,
    "deleted_by"             ntext,
    "adsk_row_id"            ntext
);

--
-- Table: cdcissues_placements
--
DROP TABLE IF EXISTS cdcissues_placements;
CREATE TABLE cdcissues_placements (
    "placement_id"           uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "issue_id"               uniqueidentifier,
    "lineage_urn"            ntext,
    "type"                   ntext,
    "created_at_version"     numeric,
    "origin_product"         ntext,
    "origin_tool"            ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "deleted_by"             ntext,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcissues_root_cause_categories
--
DROP TABLE IF EXISTS cdcissues_root_cause_categories;
CREATE TABLE cdcissues_root_cause_categories (
    "root_cause_category_id" uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "root_cause_category"    ntext,
    "is_active"              bit,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "deleted_by"             ntext,
    "deleted_at"             datetime,
    "is_system"              bit,
    "adsk_row_id"            ntext
);

--
-- Table: cdcissues_root_causes
--
DROP TABLE IF EXISTS cdcissues_root_causes;
CREATE TABLE cdcissues_root_causes (
    "root_cause_id"          uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "root_cause_category_id" uniqueidentifier,
    "title"                  ntext,
    "is_active"              bit,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "deleted_by"             ntext,
    "deleted_at"             datetime,
    "is_system"              bit,
    "adsk_row_id"            ntext
);

--
-- Table: cdcissues_viewables
--
DROP TABLE IF EXISTS cdcissues_viewables;
CREATE TABLE cdcissues_viewables (
    "placement_id"           uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "issue_id"               uniqueidentifier,
    "file_version"           numeric,
    "file_version_urn"       ntext,
    "guid"                   ntext,
    "name"                   ntext,
    "viewable_id"            ntext,
    "is_3d"                  bit,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

-- =================================================================
-- # Schema: cdclocations
-- =================================================================
--
-- Table: cdclocations_nodes
--
DROP TABLE IF EXISTS cdclocations_nodes;
CREATE TABLE cdclocations_nodes (
    "tree_id"                uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "parent_id"              uniqueidentifier,
    "id"                     uniqueidentifier,
    "name"                   ntext,
    "order"                  numeric,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdclocations_trees
--
DROP TABLE IF EXISTS cdclocations_trees;
CREATE TABLE cdclocations_trees (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

-- =================================================================
-- # Schema: cdcmarkups
-- =================================================================
--
-- Table: cdcmarkups_layer
--
DROP TABLE IF EXISTS cdcmarkups_layer;
CREATE TABLE cdcmarkups_layer (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "uid"                    uniqueidentifier,
    "surface_uid"            uniqueidentifier,
    "name"                   ntext,
    "promotable"             bit,
    "surface_type"           ntext,
    "base_entity_urn"        ntext,
    "base_entity_uid"        uniqueidentifier,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcmarkups_link
--
DROP TABLE IF EXISTS cdcmarkups_link;
CREATE TABLE cdcmarkups_link (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "uid"                    uniqueidentifier,
    "markup_id"              numeric,
    "type"                   ntext,
    "destination"            uniqueidentifier,
    "uri"                    ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "deleted"                bit,
    "deleted_by"             ntext,
    "deleted_at"             datetime,
    "updated_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcmarkups_markup
--
DROP TABLE IF EXISTS cdcmarkups_markup;
CREATE TABLE cdcmarkups_markup (
    "id"                     numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "uid"                    uniqueidentifier,
    "feature_bound_uid"      uniqueidentifier,
    "feature_bound_type"     ntext,
    "type"                   ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "deleted"                bit,
    "deleted_by"             ntext,
    "deleted_at"             datetime,
    "markup_text"            ntext,
    "adsk_row_id"            ntext
);

--
-- Table: cdcmarkups_placement
--
DROP TABLE IF EXISTS cdcmarkups_placement;
CREATE TABLE cdcmarkups_placement (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "markup_uid"             uniqueidentifier,
    "surface_uid"            uniqueidentifier,
    "published"              bit,
    "layer_uid"              uniqueidentifier,
    "id"                     numeric,
    "uid"                    uniqueidentifier,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "deleted"                bit,
    "deleted_by"             ntext,
    "deleted_at"             datetime,
    "placement_text"         ntext,
    "adsk_row_id"            ntext
);

-- =================================================================
-- # Schema: cdcmeetingminutes
-- =================================================================
--
-- Table: cdcmeetingminutes_assignees
--
DROP TABLE IF EXISTS cdcmeetingminutes_assignees;
CREATE TABLE cdcmeetingminutes_assignees (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "item_id"                uniqueidentifier,
    "participant_id"         uniqueidentifier,
    "non_member_participant_id" uniqueidentifier,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcmeetingminutes_attachments
--
DROP TABLE IF EXISTS cdcmeetingminutes_attachments;
CREATE TABLE cdcmeetingminutes_attachments (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "item_id"                uniqueidentifier,
    "meeting_id"             uniqueidentifier,
    "uri"                    ntext,
    "origin"                 ntext,
    "name"                   ntext,
    "created_by"             ntext,
    "updated_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcmeetingminutes_items
--
DROP TABLE IF EXISTS cdcmeetingminutes_items;
CREATE TABLE cdcmeetingminutes_items (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "topic_id"               uniqueidentifier,
    "order_index"            numeric,
    "description"            ntext,
    "status"                 ntext,
    "cross_series_id"        uniqueidentifier,
    "due_date"               datetime,
    "created_by"             ntext,
    "updated_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcmeetingminutes_meetings
--
DROP TABLE IF EXISTS cdcmeetingminutes_meetings;
CREATE TABLE cdcmeetingminutes_meetings (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "series_id"              uniqueidentifier,
    "title"                  ntext,
    "description"            ntext,
    "summary"                ntext,
    "status"                 ntext,
    "num_in_series"          numeric,
    "meeting_location"       ntext,
    "starts_at"              datetime,
    "duration"               numeric,
    "video_conference_link"  ntext,
    "created_by"             ntext,
    "updated_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcmeetingminutes_non_member_participants
--
DROP TABLE IF EXISTS cdcmeetingminutes_non_member_participants;
CREATE TABLE cdcmeetingminutes_non_member_participants (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "meeting_id"             uniqueidentifier,
    "first_name"             ntext,
    "last_name"              ntext,
    "company"                ntext,
    "email"                  ntext,
    "status"                 ntext,
    "created_by"             ntext,
    "updated_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcmeetingminutes_participants
--
DROP TABLE IF EXISTS cdcmeetingminutes_participants;
CREATE TABLE cdcmeetingminutes_participants (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "meeting_id"             uniqueidentifier,
    "autodesk_id"            ntext,
    "type"                   ntext,
    "status"                 ntext,
    "created_by"             ntext,
    "updated_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcmeetingminutes_topics
--
DROP TABLE IF EXISTS cdcmeetingminutes_topics;
CREATE TABLE cdcmeetingminutes_topics (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "meeting_id"             uniqueidentifier,
    "order_index"            numeric,
    "name"                   ntext,
    "created_by"             ntext,
    "updated_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

-- =================================================================
-- # Schema: cdcrelationships
-- =================================================================
--
-- Table: cdcrelationships_entity_relationship
--
DROP TABLE IF EXISTS cdcrelationships_entity_relationship;
CREATE TABLE cdcrelationships_entity_relationship (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "relationship_guid"      uniqueidentifier,
    "item1_domain"           ntext,
    "item1_entitytype"       ntext,
    "item1_id"               ntext,
    "item2_domain"           ntext,
    "item2_entitytype"       ntext,
    "item2_id"               ntext,
    "created_at"             datetime,
    "deleted_at"             datetime,
    "is_deleted"             bit,
    "is_service_owned"       bit,
    "updated_at"             datetime,
    "adsk_row_id"            ntext
);

-- =================================================================
-- # Schema: cdcrfis
-- =================================================================
--
-- Table: cdcrfis_acc_attachments
--
DROP TABLE IF EXISTS cdcrfis_acc_attachments;
CREATE TABLE cdcrfis_acc_attachments (
    "id"                     uniqueidentifier,
    "rfi_id"                 uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "entity_id"              uniqueidentifier,
    "entity_type"            ntext,
    "display_name"           ntext,
    "created_at"             datetime,
    "created_by"             ntext,
    "deleted_at"             datetime,
    "deleted_by"             ntext,
    "updated_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcrfis_attachments
--
DROP TABLE IF EXISTS cdcrfis_attachments;
CREATE TABLE cdcrfis_attachments (
    "rfi_id"                 uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "id"                     uniqueidentifier,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "deleted_by"             ntext,
    "name"                   ntext,
    "adsk_row_id"            ntext
);

--
-- Table: cdcrfis_category
--
DROP TABLE IF EXISTS cdcrfis_category;
CREATE TABLE cdcrfis_category (
    "rfi_id"                 uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "category"               ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcrfis_comments
--
DROP TABLE IF EXISTS cdcrfis_comments;
CREATE TABLE cdcrfis_comments (
    "rfi_id"                 uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "id"                     uniqueidentifier,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "body"                   ntext,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcrfis_discipline
--
DROP TABLE IF EXISTS cdcrfis_discipline;
CREATE TABLE cdcrfis_discipline (
    "rfi_id"                 uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "discipline"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcrfis_project_custom_attributes
--
DROP TABLE IF EXISTS cdcrfis_project_custom_attributes;
CREATE TABLE cdcrfis_project_custom_attributes (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "type"                   ntext,
    "description"            ntext,
    "multiple_choice"        bit,
    "status"                 ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcrfis_project_custom_attributes_enums
--
DROP TABLE IF EXISTS cdcrfis_project_custom_attributes_enums;
CREATE TABLE cdcrfis_project_custom_attributes_enums (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "custom_attribute_id"    uniqueidentifier,
    "name"                   ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcrfis_rfi_assignees
--
DROP TABLE IF EXISTS cdcrfis_rfi_assignees;
CREATE TABLE cdcrfis_rfi_assignees (
    "id"                     uniqueidentifier,
    "rfi_id"                 uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "oxygen_id"              ntext,
    "type"                   ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcrfis_rfi_co_reviewers
--
DROP TABLE IF EXISTS cdcrfis_rfi_co_reviewers;
CREATE TABLE cdcrfis_rfi_co_reviewers (
    "rfi_id"                 uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "user_id"                ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcrfis_rfi_custom_attributes
--
DROP TABLE IF EXISTS cdcrfis_rfi_custom_attributes;
CREATE TABLE cdcrfis_rfi_custom_attributes (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "rfi_id"                 uniqueidentifier,
    "custom_attribute_id"    uniqueidentifier,
    "value_enum_id"          uniqueidentifier,
    "value_float"            numeric,
    "value_str"              ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcrfis_rfi_distribution_list
--
DROP TABLE IF EXISTS cdcrfis_rfi_distribution_list;
CREATE TABLE cdcrfis_rfi_distribution_list (
    "rfi_id"                 uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "user_id"                ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcrfis_rfi_location
--
DROP TABLE IF EXISTS cdcrfis_rfi_location;
CREATE TABLE cdcrfis_rfi_location (
    "rfi_id"                 uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "location"               ntext,
    "location_ids"           ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcrfis_rfi_responses
--
DROP TABLE IF EXISTS cdcrfis_rfi_responses;
CREATE TABLE cdcrfis_rfi_responses (
    "id"                     uniqueidentifier,
    "rfi_id"                 uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "content"                ntext,
    "updated_by"             ntext,
    "created_by"             ntext,
    "on_behalf"              ntext,
    "status"                 ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "state"                  ntext,
    "adsk_row_id"            ntext
);

--
-- Table: cdcrfis_rfi_reviewers
--
DROP TABLE IF EXISTS cdcrfis_rfi_reviewers;
CREATE TABLE cdcrfis_rfi_reviewers (
    "rfi_id"                 uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "user_id"                ntext,
    "type"                   ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcrfis_rfi_transitions
--
DROP TABLE IF EXISTS cdcrfis_rfi_transitions;
CREATE TABLE cdcrfis_rfi_transitions (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "rfi_id"                 uniqueidentifier,
    "from_status"            ntext,
    "to_status"              ntext,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcrfis_rfi_types
--
DROP TABLE IF EXISTS cdcrfis_rfi_types;
CREATE TABLE cdcrfis_rfi_types (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "wf_type"                ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcrfis_rfis
--
DROP TABLE IF EXISTS cdcrfis_rfis;
CREATE TABLE cdcrfis_rfis (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "custom_identifier"      ntext,
    "title"                  ntext,
    "question"               ntext,
    "status"                 ntext,
    "due_date"               datetime,
    "linked_document"        ntext,
    "linked_document_version" numeric,
    "linked_document_close_version" numeric,
    "official_response"      ntext,
    "official_response_status" ntext,
    "responded_at"           datetime,
    "responded_by"           ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "closed_by"              ntext,
    "closed_at"              datetime,
    "suggested_answer"       ntext,
    "manager_id"             ntext,
    "answered_at"            datetime,
    "answered_by"            ntext,
    "cost_impact"            ntext,
    "schedule_impact"        ntext,
    "priority"               ntext,
    "reference"              ntext,
    "opened_at"              datetime,
    "location_id"            ntext,
    "rfi_type"               uniqueidentifier,
    "bridged_source"         bit,
    "bridged_target"         bit,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

-- =================================================================
-- # Schema: cdcschedule
-- =================================================================
--
-- Table: cdcschedule_activities
--
DROP TABLE IF EXISTS cdcschedule_activities;
CREATE TABLE cdcschedule_activities (
    "id"                     uniqueidentifier,
    "schedule_id"            uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "unique_id"              numeric,
    "sequential_id"          numeric,
    "file_activity_id"       ntext,
    "parent_unique_id"       numeric,
    "type"                   ntext,
    "name"                   ntext,
    "is_critical_path"       bit,
    "completion_percentage"  numeric,
    "planned_start"          datetime,
    "planned_finish"         datetime,
    "actual_start"           datetime,
    "actual_finish"          datetime,
    "start"                  datetime,
    "finish"                 datetime,
    "duration"               numeric,
    "actual_duration"        numeric,
    "remaining_duration"     numeric,
    "free_slack_units"       ntext,
    "free_slack_duration"    numeric,
    "total_slack_units"      ntext,
    "total_slack_duration"   numeric,
    "is_wbs"                 bit,
    "wbs_path"               ntext,
    "wbs_code"               ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "wbs_path_text"          ntext,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcschedule_activity_codes
--
DROP TABLE IF EXISTS cdcschedule_activity_codes;
CREATE TABLE cdcschedule_activity_codes (
    "id"                     uniqueidentifier,
    "schedule_id"            uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_unique_id"     numeric,
    "name"                   ntext,
    "value"                  ntext,
    "value_description"      ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcschedule_comments
--
DROP TABLE IF EXISTS cdcschedule_comments;
CREATE TABLE cdcschedule_comments (
    "id"                     uniqueidentifier,
    "schedule_id"            uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_unique_id"     numeric,
    "body"                   ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcschedule_dependencies
--
DROP TABLE IF EXISTS cdcschedule_dependencies;
CREATE TABLE cdcschedule_dependencies (
    "id"                     uniqueidentifier,
    "schedule_id"            uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "source_unique_id"       numeric,
    "target_unique_id"       numeric,
    "type"                   ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcschedule_plan_commitments
--
DROP TABLE IF EXISTS cdcschedule_plan_commitments;
CREATE TABLE cdcschedule_plan_commitments (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "plan_id"                uniqueidentifier,
    "task_id"                uniqueidentifier,
    "replanned_commitment_id" uniqueidentifier,
    "root_cause_id"          uniqueidentifier,
    "task_type"              ntext,
    "work_type"              ntext,
    "status"                 ntext,
    "start_date"             date,
    "finish_date"            date,
    "duration"               numeric,
    "assigned_member_id"     ntext,
    "assigned_company_id"    ntext,
    "assigned_role_id"       ntext,
    "location_id"            uniqueidentifier,
    "wbs_id"                 uniqueidentifier,
    "crew_size"              numeric,
    "was_start_changed"      bit,
    "was_duration_changed"   bit,
    "was_finish_changed"     bit,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcschedule_plan_handoffs
--
DROP TABLE IF EXISTS cdcschedule_plan_handoffs;
CREATE TABLE cdcschedule_plan_handoffs (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "plan_id"                uniqueidentifier,
    "source_task"            uniqueidentifier,
    "target_task"            uniqueidentifier,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcschedule_plan_plans
--
DROP TABLE IF EXISTS cdcschedule_plan_plans;
CREATE TABLE cdcschedule_plan_plans (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "schedule_id"            uniqueidentifier,
    "created_by"             ntext,
    "updated_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcschedule_plan_project_settings
--
DROP TABLE IF EXISTS cdcschedule_plan_project_settings;
CREATE TABLE cdcschedule_plan_project_settings (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "non_working_dates"      ntext,
    "first_day_of_the_week"  ntext,
    "working_days"           ntext,
    "wbs_tree"               ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcschedule_plan_task_comments
--
DROP TABLE IF EXISTS cdcschedule_plan_task_comments;
CREATE TABLE cdcschedule_plan_task_comments (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "task_id"                uniqueidentifier,
    "plan_id"                uniqueidentifier,
    "body"                   ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "created_by"             ntext,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcschedule_plan_tasks
--
DROP TABLE IF EXISTS cdcschedule_plan_tasks;
CREATE TABLE cdcschedule_plan_tasks (
    "id"                     uniqueidentifier,
    "plan_id"                uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "parent_task_id"         uniqueidentifier,
    "activity_unique_id"     numeric,
    "unique_id"              numeric,
    "task_type"              ntext,
    "work_type"              ntext,
    "status"                 ntext,
    "title"                  ntext,
    "description"            ntext,
    "start_date"             date,
    "finish_date"            date,
    "duration"               numeric,
    "location_id"            uniqueidentifier,
    "assigned_member_id"     ntext,
    "assigned_company_id"    ntext,
    "assigned_role_id"       ntext,
    "wbs_id"                 uniqueidentifier,
    "completion_percentage"  numeric,
    "crew_size"              numeric,
    "priority"               numeric,
    "comments_count"         numeric,
    "commitments_count"      numeric,
    "task_imports_id"        ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "archived_at"            datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcschedule_resources
--
DROP TABLE IF EXISTS cdcschedule_resources;
CREATE TABLE cdcschedule_resources (
    "id"                     uniqueidentifier,
    "schedule_id"            uniqueidentifier,
    "resource_unique_id"     numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_unique_id"     numeric,
    "name"                   ntext,
    "type"                   ntext,
    "email_address"          ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcschedule_schedules
--
DROP TABLE IF EXISTS cdcschedule_schedules;
CREATE TABLE cdcschedule_schedules (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "type"                   ntext,
    "version_number"         numeric,
    "is_public"              bit,
    "created_by"             ntext,
    "updated_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

-- =================================================================
-- # Schema: cdcsheets
-- =================================================================
--
-- Table: cdcsheets_disciplines
--
DROP TABLE IF EXISTS cdcsheets_disciplines;
CREATE TABLE cdcsheets_disciplines (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "container_type"         ntext,
    "index"                  numeric,
    "name"                   ntext,
    "designator"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcsheets_lineages
--
DROP TABLE IF EXISTS cdcsheets_lineages;
CREATE TABLE cdcsheets_lineages (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "container_type"         ntext,
    "name"                   ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcsheets_sets
--
DROP TABLE IF EXISTS cdcsheets_sets;
CREATE TABLE cdcsheets_sets (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "container_type"         ntext,
    "name"                   ntext,
    "issuance_date"          datetime,
    "created_at"             datetime,
    "created_by"             ntext,
    "created_by_name"        ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "updated_by_name"        ntext,
    "deleted"                bit,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcsheets_sheet_bubbles
--
DROP TABLE IF EXISTS cdcsheets_sheet_bubbles;
CREATE TABLE cdcsheets_sheet_bubbles (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "container_type"         ntext,
    "sheet_id"               uniqueidentifier,
    "urn"                    ntext,
    "viewable_guid"          ntext,
    "paper_width"            numeric,
    "paper_height"           numeric,
    "viewable_order"         numeric,
    "pug_urn"                ntext,
    "pug_width"              numeric,
    "pug_height"             numeric,
    "large_thumbnail_width"  numeric,
    "large_thumbnail_height" numeric,
    "small_thumbnail_width"  numeric,
    "small_thumbnail_height" numeric,
    "storage_urn"            ntext,
    "storage_size"           numeric,
    "viewable_urn"           ntext,
    "viewable_width"         numeric,
    "viewable_height"        numeric,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcsheets_sheet_tags
--
DROP TABLE IF EXISTS cdcsheets_sheet_tags;
CREATE TABLE cdcsheets_sheet_tags (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "container_type"         ntext,
    "sheet_id"               uniqueidentifier,
    "value"                  ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcsheets_sheets
--
DROP TABLE IF EXISTS cdcsheets_sheets;
CREATE TABLE cdcsheets_sheets (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "container_type"         ntext,
    "name"                   ntext,
    "nat_sort_name"          ntext,
    "history_id"             uniqueidentifier,
    "version_set_id"         uniqueidentifier,
    "created_at"             datetime,
    "created_by"             ntext,
    "created_by_name"        ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "updated_by_name"        ntext,
    "title"                  ntext,
    "upload_file_name"       ntext,
    "upload_id"              uniqueidentifier,
    "processing_state"       ntext,
    "is_current"             bit,
    "discipline_index"       numeric,
    "deleted"                bit,
    "deleted_at"             datetime,
    "deleted_by"             ntext,
    "deleted_by_name"        ntext,
    "original_set_name"      ntext,
    "adsk_row_id"            ntext
);

-- =================================================================
-- # Schema: cdcsubmittalsacc
-- =================================================================
--
-- Table: cdcsubmittalsacc_attachments
--
DROP TABLE IF EXISTS cdcsubmittalsacc_attachments;
CREATE TABLE cdcsubmittalsacc_attachments (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "item_id"                uniqueidentifier,
    "name"                   ntext,
    "revision"               numeric,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "upload_urn"             ntext,
    "category_id"            ntext,
    "category_value"         ntext,
    "task_id"                uniqueidentifier,
    "is_file_uploaded"       bit,
    "urn"                    ntext,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcsubmittalsacc_comments
--
DROP TABLE IF EXISTS cdcsubmittalsacc_comments;
CREATE TABLE cdcsubmittalsacc_comments (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "item_id"                uniqueidentifier,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "created_by"             ntext,
    "created_at"             datetime,
    "body"                   ntext,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcsubmittalsacc_custom_identifier_settings
--
DROP TABLE IF EXISTS cdcsubmittalsacc_custom_identifier_settings;
CREATE TABLE cdcsubmittalsacc_custom_identifier_settings (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "can_switch_type"        bit,
    "sequence_type"          ntext,
    "created_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcsubmittalsacc_item_custom_attribute_value
--
DROP TABLE IF EXISTS cdcsubmittalsacc_item_custom_attribute_value;
CREATE TABLE cdcsubmittalsacc_item_custom_attribute_value (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "item_id"                uniqueidentifier,
    "parameter_id"           uniqueidentifier,
    "parameter_name"         ntext,
    "parameter_type"         ntext,
    "value"                  ntext,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "deleted_at"             datetime,
    "select_value"           ntext,
    "adsk_row_id"            ntext
);

--
-- Table: cdcsubmittalsacc_item_revision
--
DROP TABLE IF EXISTS cdcsubmittalsacc_item_revision;
CREATE TABLE cdcsubmittalsacc_item_revision (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "id"                     uniqueidentifier,
    "item_id"                uniqueidentifier,
    "manager"                ntext,
    "manager_type"           ntext,
    "subcontractor"          ntext,
    "subcontractor_type"     ntext,
    "revision"               numeric,
    "created_at"             datetime,
    "updated_at"             datetime,
    "sent_to_submitter"      datetime,
    "submitter_due_date"     date,
    "received_from_submitter" datetime,
    "submitted_by"           ntext,
    "sent_to_review"         datetime,
    "manager_due_date"       date,
    "sent_to_review_by"      ntext,
    "received_from_review"   datetime,
    "response_id"            ntext,
    "response_comment"       ntext,
    "responded_at"           datetime,
    "responded_by"           ntext,
    "published_date"         datetime,
    "published_by"           ntext,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcsubmittalsacc_item_watchers
--
DROP TABLE IF EXISTS cdcsubmittalsacc_item_watchers;
CREATE TABLE cdcsubmittalsacc_item_watchers (
    "item_id"                uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "user_id"                ntext,
    "user_type_id"           ntext,
    "user_type_value"        ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcsubmittalsacc_items
--
DROP TABLE IF EXISTS cdcsubmittalsacc_items;
CREATE TABLE cdcsubmittalsacc_items (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "spec_id"                uniqueidentifier,
    "spec_identifier"        ntext,
    "title"                  ntext,
    "type_id"                ntext,
    "type_value"             ntext,
    "response_comment"       ntext,
    "ball_in_court"          ntext,
    "revision"               numeric,
    "responded_by"           ntext,
    "description"            ntext,
    "responded_at"           datetime,
    "due_date"               date,
    "required_on_job_date"   date,
    "manager"                ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "state_id"               ntext,
    "response_id"            ntext,
    "response_value"         ntext,
    "subsection"             ntext,
    "subcontractor"          ntext,
    "identifier"             numeric,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "status_id"              ntext,
    "status_value"           ntext,
    "package_title"          ntext,
    "package"                uniqueidentifier,
    "package_identifier"     numeric,
    "priority_id"            numeric,
    "priority_value"         ntext,
    "required_date"          date,
    "required_approval_date" date,
    "lead_time"              numeric,
    "sent_to_submitter"      datetime,
    "received_from_submitter" datetime,
    "submitted_by"           ntext,
    "sent_to_review"         datetime,
    "sent_to_review_by"      ntext,
    "received_from_review"   datetime,
    "published_date"         datetime,
    "published_by"           ntext,
    "submitter_due_date"     date,
    "manager_due_date"       date,
    "ball_in_court_users"    ntext,
    "ball_in_court_roles"    ntext,
    "ball_in_court_companies" ntext,
    "manager_type"           ntext,
    "subcontractor_type"     ntext,
    "custom_identifier"      ntext,
    "custom_identifier_sort" ntext,
    "custom_identifier_human_readable" ntext,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext,
    "pending_actions_from"   ntext
);

--
-- Table: cdcsubmittalsacc_itemtype
--
DROP TABLE IF EXISTS cdcsubmittalsacc_itemtype;
CREATE TABLE cdcsubmittalsacc_itemtype (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "created_by"             ntext,
    "value"                  ntext,
    "platform_id"            ntext,
    "is_active"              bit,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcsubmittalsacc_packages
--
DROP TABLE IF EXISTS cdcsubmittalsacc_packages;
CREATE TABLE cdcsubmittalsacc_packages (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "spec_id"                uniqueidentifier,
    "title"                  ntext,
    "identifier"             numeric,
    "description"            ntext,
    "updated_by"             ntext,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "spec_identifier"        ntext,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcsubmittalsacc_parameters_collections
--
DROP TABLE IF EXISTS cdcsubmittalsacc_parameters_collections;
CREATE TABLE cdcsubmittalsacc_parameters_collections (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "parameter_id"           uniqueidentifier,
    "parameter_external_id"  ntext,
    "parameter_name"         ntext,
    "parameter_description"  ntext,
    "parameter_type"         ntext,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "deleted_at"             datetime,
    "parameter_select_options" ntext,
    "adsk_row_id"            ntext
);

--
-- Table: cdcsubmittalsacc_specs
--
DROP TABLE IF EXISTS cdcsubmittalsacc_specs;
CREATE TABLE cdcsubmittalsacc_specs (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "id"                     uniqueidentifier,
    "identifier"             ntext,
    "title"                  ntext,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcsubmittalsacc_steps
--
DROP TABLE IF EXISTS cdcsubmittalsacc_steps;
CREATE TABLE cdcsubmittalsacc_steps (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "created_by"             ntext,
    "created_at"             datetime,
    "status"                 ntext,
    "step_number"            numeric,
    "days_to_respond"        numeric,
    "due_date"               date,
    "started_at"             datetime,
    "completed_at"           datetime,
    "item_id"                uniqueidentifier,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdcsubmittalsacc_tasks
--
DROP TABLE IF EXISTS cdcsubmittalsacc_tasks;
CREATE TABLE cdcsubmittalsacc_tasks (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "created_by"             ntext,
    "created_at"             datetime,
    "status"                 ntext,
    "assigned_to"            ntext,
    "is_required"            bit,
    "response_comment"       ntext,
    "responded_at"           datetime,
    "responded_by"           ntext,
    "started_at"             datetime,
    "completed_at"           datetime,
    "completed_by"           ntext,
    "response_value"         ntext,
    "response_id"            uniqueidentifier,
    "step_id"                uniqueidentifier,
    "assigned_to_type"       ntext,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

-- =================================================================
-- # Schema: cdctransmittals
-- =================================================================
--
-- Table: cdctransmittals_transmittal_documents
--
DROP TABLE IF EXISTS cdctransmittals_transmittal_documents;
CREATE TABLE cdctransmittals_transmittal_documents (
    "id"                     uniqueidentifier,
    "workflow_transmittal_id" uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "urn"                    ntext,
    "file_name"              ntext,
    "version_number"         numeric,
    "revision_number"        numeric,
    "parent_folder_urn"      ntext,
    "last_modified_time"     datetime,
    "last_modified_user_id"  ntext,
    "last_modified_user_name" ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdctransmittals_transmittal_non_members
--
DROP TABLE IF EXISTS cdctransmittals_transmittal_non_members;
CREATE TABLE cdctransmittals_transmittal_non_members (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "email"                  ntext,
    "first_name"             ntext,
    "last_name"              ntext,
    "company_name"           ntext,
    "role"                   ntext,
    "workflow_transmittal_id" uniqueidentifier,
    "viewed_at"              datetime,
    "downloaded_at"          datetime,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdctransmittals_transmittal_recipients
--
DROP TABLE IF EXISTS cdctransmittals_transmittal_recipients;
CREATE TABLE cdctransmittals_transmittal_recipients (
    "id"                     uniqueidentifier,
    "workflow_transmittal_id" uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "user_id"                uniqueidentifier,
    "user_name"              ntext,
    "email"                  ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "company_name"           ntext,
    "viewed_at"              datetime,
    "downloaded_at"          datetime,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

--
-- Table: cdctransmittals_workflow_transmittals
--
DROP TABLE IF EXISTS cdctransmittals_workflow_transmittals;
CREATE TABLE cdctransmittals_workflow_transmittals (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "sequence_id"            numeric,
    "title"                  ntext,
    "status"                 numeric,
    "create_user_id"         uniqueidentifier,
    "create_user_name"       ntext,
    "docs_count"             numeric,
    "created_at"             datetime,
    "updated_at"             datetime,
    "create_user_company_id" ntext,
    "create_user_company_name" ntext,
    "deleted_at"             datetime,
    "adsk_row_id"            ntext
);

-- =================================================================
-- # Schema: checklists
-- =================================================================
--
-- Table: checklists_checklist_assignees
--
DROP TABLE IF EXISTS checklists_checklist_assignees;
CREATE TABLE checklists_checklist_assignees (
    "instance_id"            numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "id"                     numeric,
    "assignee_id"            ntext,
    "name"                   ntext,
    "assignee_type"          ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "is_previous_assignee"   bit
);

--
-- Table: checklists_checklist_attachments
--
DROP TABLE IF EXISTS checklists_checklist_attachments;
CREATE TABLE checklists_checklist_attachments (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "lineage_urn"            ntext,
    "version"                numeric,
    "instance_id"            numeric
);

--
-- Table: checklists_checklist_item_doc_attachments
--
DROP TABLE IF EXISTS checklists_checklist_item_doc_attachments;
CREATE TABLE checklists_checklist_item_doc_attachments (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "lineage_urn"            ntext,
    "item_id"                numeric,
    "section_id"             numeric,
    "instance_id"            numeric
);

--
-- Table: checklists_checklist_items
--
DROP TABLE IF EXISTS checklists_checklist_items;
CREATE TABLE checklists_checklist_items (
    "id"                     numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "created_at"             datetime,
    "updated_at"             datetime,
    "instance_section_id"    numeric,
    "template_item_id"       numeric,
    "modified_by"            ntext,
    "is_required"            bit,
    "note"                   ntext,
    "title"                  ntext,
    "answers"                ntext,
    "instance_id"            numeric,
    "answer_type"            numeric,
    "answers_v2"             ntext
);

--
-- Table: checklists_checklist_items_answers
--
DROP TABLE IF EXISTS checklists_checklist_items_answers;
CREATE TABLE checklists_checklist_items_answers (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "answer"                 ntext,
    "item_version_id"        numeric
);

--
-- Table: checklists_checklist_section_assignees
--
DROP TABLE IF EXISTS checklists_checklist_section_assignees;
CREATE TABLE checklists_checklist_section_assignees (
    "id"                     numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "instance_id"            numeric,
    "instance_section_id"    numeric,
    "id2"                    numeric,
    "assignee_id"            ntext,
    "assignee_type"          ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "is_previous_section_assignee" bit
);

--
-- Table: checklists_checklist_sections
--
DROP TABLE IF EXISTS checklists_checklist_sections;
CREATE TABLE checklists_checklist_sections (
    "id"                     numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "created_at"             datetime,
    "updated_at"             datetime,
    "instance_id"            numeric,
    "template_section_id"    numeric,
    "modified_by"            ntext,
    "status"                 ntext
);

--
-- Table: checklists_checklist_sections_signatures
--
DROP TABLE IF EXISTS checklists_checklist_sections_signatures;
CREATE TABLE checklists_checklist_sections_signatures (
    "id"                     uniqueidentifier,
    "instance_section_id"    numeric,
    "instance_id"            numeric,
    "required_by"            ntext,
    "is_required"            bit,
    "instructions"           ntext,
    "signed_name"            ntext,
    "signed_company"         ntext,
    "submitted_by"           ntext,
    "signed_at"              datetime,
    "created_at"             datetime,
    "deleted_at"             datetime,
    "urn"                    ntext,
    "oss_urn"                ntext,
    "upload_status"          ntext,
    "bim360_project_id"      uniqueidentifier,
    "bim360_account_id"      uniqueidentifier
);

--
-- Table: checklists_checklist_signatures
--
DROP TABLE IF EXISTS checklists_checklist_signatures;
CREATE TABLE checklists_checklist_signatures (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "instance_id"            numeric,
    "required_by"            ntext,
    "is_required"            bit,
    "defined_at"             ntext,
    "required_name"          ntext,
    "required_company"       ntext,
    "signed_name"            ntext,
    "signed_company"         ntext,
    "submitted_by"           ntext,
    "signed_at"              datetime,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "type"                   ntext,
    "is_signed"              bit
);

--
-- Table: checklists_checklists
--
DROP TABLE IF EXISTS checklists_checklists;
CREATE TABLE checklists_checklists (
    "id"                     numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "scheduled_date"         datetime,
    "location"               ntext,
    "title"                  ntext,
    "template_id"            numeric,
    "template_version_id"    numeric,
    "created_by"             ntext,
    "modified_by"            ntext,
    "updated_at"             datetime,
    "created_at"             datetime,
    "deleted_at"             datetime,
    "instructions"           ntext,
    "template_type"          ntext,
    "status"                 ntext,
    "progress"               numeric,
    "completed_items_count"  numeric,
    "items_count"            numeric,
    "sections_count"         numeric,
    "created_by_company"     ntext,
    "required_signatures_count" numeric,
    "unsigned_signatures_count" numeric,
    "allow_section_assignee" bit,
    "checklist_id"           numeric,
    "completed_on"           datetime,
    "started_on"             datetime,
    "is_archived"            bit,
    "archived_on"            datetime,
    "archived_by"            ntext
);

--
-- Table: checklists_template_item_instructions
--
DROP TABLE IF EXISTS checklists_template_item_instructions;
CREATE TABLE checklists_template_item_instructions (
    "template_id"            numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "template_version_id"    numeric,
    "section_id"             numeric,
    "item_id"                numeric,
    "item_version_id"        numeric,
    "id"                     numeric,
    "instructions_type"      ntext,
    "data"                   ntext,
    "updated_at"             datetime,
    "created_at"             datetime
);

--
-- Table: checklists_template_items
--
DROP TABLE IF EXISTS checklists_template_items;
CREATE TABLE checklists_template_items (
    "template_version_id"    numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "template_id"            numeric,
    "template_section_id"    numeric,
    "item_id"                numeric,
    "item_version_id"        numeric,
    "number"                 numeric,
    "index"                  numeric,
    "is_required"            bit,
    "title"                  ntext,
    "section_id"             numeric,
    "updated_at"             datetime,
    "created_at"             datetime,
    "response_type"          ntext,
    "possible_answers"       ntext
);

--
-- Table: checklists_template_items_all
--
DROP TABLE IF EXISTS checklists_template_items_all;
CREATE TABLE checklists_template_items_all (
    "template_version_id"    numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "template_id"            numeric,
    "template_section_id"    numeric,
    "item_id"                numeric,
    "item_version_id"        numeric,
    "number"                 numeric,
    "index"                  numeric,
    "is_required"            bit,
    "title"                  ntext,
    "section_id"             numeric,
    "updated_at"             datetime,
    "created_at"             datetime,
    "response_type"          ntext,
    "possible_answers"       ntext
);

--
-- Table: checklists_template_items_answers
--
DROP TABLE IF EXISTS checklists_template_items_answers;
CREATE TABLE checklists_template_items_answers (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "list_response_id"       uniqueidentifier,
    "possible_answers"       ntext
);

--
-- Table: checklists_template_sections
--
DROP TABLE IF EXISTS checklists_template_sections;
CREATE TABLE checklists_template_sections (
    "id"                     numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "template_id"            numeric,
    "template_version_id"    numeric,
    "title"                  ntext,
    "number"                 numeric,
    "index"                  numeric,
    "instructions"           ntext,
    "updated_at"             datetime,
    "created_at"             datetime
);

--
-- Table: checklists_template_sections_all
--
DROP TABLE IF EXISTS checklists_template_sections_all;
CREATE TABLE checklists_template_sections_all (
    "id"                     numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "template_id"            numeric,
    "template_version_id"    numeric,
    "title"                  ntext,
    "number"                 numeric,
    "index"                  numeric,
    "instructions"           ntext,
    "updated_at"             datetime,
    "created_at"             datetime
);

--
-- Table: checklists_template_signatures
--
DROP TABLE IF EXISTS checklists_template_signatures;
CREATE TABLE checklists_template_signatures (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "template_version_id"    numeric,
    "template_id"            numeric,
    "required_by"            ntext,
    "is_required"            bit,
    "updated_at"             datetime,
    "created_at"             datetime
);

--
-- Table: checklists_template_signatures_all
--
DROP TABLE IF EXISTS checklists_template_signatures_all;
CREATE TABLE checklists_template_signatures_all (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "template_version_id"    numeric,
    "template_id"            numeric,
    "required_by"            ntext,
    "is_required"            bit,
    "updated_at"             datetime,
    "created_at"             datetime
);

--
-- Table: checklists_templates
--
DROP TABLE IF EXISTS checklists_templates;
CREATE TABLE checklists_templates (
    "template_id"            numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "title"                  ntext,
    "template_version_id"    numeric,
    "created_by"             ntext,
    "updated_at"             datetime,
    "created_at"             datetime,
    "instructions"           ntext,
    "template_type"          ntext,
    "allow_section_assignee" bit,
    "items_count"            numeric,
    "sections_count"         numeric,
    "modified_by"            ntext,
    "version_number"         numeric,
    "share_status"           ntext,
    "deleted_at"             datetime
);

--
-- Table: checklists_templates_versions
--
DROP TABLE IF EXISTS checklists_templates_versions;
CREATE TABLE checklists_templates_versions (
    "template_id"            numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "title"                  ntext,
    "template_version_id"    numeric,
    "created_by"             ntext,
    "updated_at"             datetime,
    "created_at"             datetime,
    "instructions"           ntext,
    "template_type"          ntext,
    "allow_section_assignee" bit,
    "items_count"            numeric,
    "sections_count"         numeric,
    "modified_by"            ntext,
    "version_number"         numeric,
    "share_status"           ntext,
    "deleted_at"             datetime
);

-- =================================================================
-- # Schema: clashes
-- =================================================================
--
-- Table: clashes_assigned_clash_group
--
DROP TABLE IF EXISTS clashes_assigned_clash_group;
CREATE TABLE clashes_assigned_clash_group (
    "clash_group_id"         uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "issue_id"               uniqueidentifier,
    "title"                  ntext,
    "description"            ntext,
    "status"                 ntext,
    "clash_test_id"          uniqueidentifier,
    "model_set_id"           uniqueidentifier,
    "created_at_model_set_version" numeric,
    "created_at"             datetime,
    "created_by"             ntext
);

--
-- Table: clashes_clash_group_to_clash_id
--
DROP TABLE IF EXISTS clashes_clash_group_to_clash_id;
CREATE TABLE clashes_clash_group_to_clash_id (
    "clash_group_id"         uniqueidentifier,
    "clash_id"               numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier
);

--
-- Table: clashes_clash_test
--
DROP TABLE IF EXISTS clashes_clash_test;
CREATE TABLE clashes_clash_test (
    "clash_test_id"          uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "model_set_id"           uniqueidentifier,
    "model_set_version"      numeric,
    "root_folder_urn"        ntext,
    "started_at"             datetime,
    "completed_at"           datetime,
    "status"                 ntext,
    "backend_type"           numeric
);

--
-- Table: clashes_closed_clash_group
--
DROP TABLE IF EXISTS clashes_closed_clash_group;
CREATE TABLE clashes_closed_clash_group (
    "clash_group_id"         uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "reason"                 ntext,
    "title"                  ntext,
    "description"            ntext,
    "clash_test_id"          uniqueidentifier,
    "model_set_id"           uniqueidentifier,
    "created_at_model_set_version" numeric,
    "created_at"             datetime,
    "created_by"             ntext
);

-- =================================================================
-- # Schema: classifications
-- =================================================================
--
-- Table: classifications_nodes_account
--
DROP TABLE IF EXISTS classifications_nodes_account;
CREATE TABLE classifications_nodes_account (
    "structure_id"           uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "structure_name"         ntext,
    "parent_node_id"         numeric,
    "node_id"                numeric,
    "node_code"              ntext,
    "node_name"              ntext,
    "order"                  numeric,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: classifications_nodes_library_used_in_project
--
DROP TABLE IF EXISTS classifications_nodes_library_used_in_project;
CREATE TABLE classifications_nodes_library_used_in_project (
    "structure_id"           uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "structure_name"         ntext,
    "parent_node_id"         numeric,
    "node_id"                numeric,
    "node_code"              ntext,
    "node_name"              ntext,
    "order"                  numeric,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: classifications_nodes_project
--
DROP TABLE IF EXISTS classifications_nodes_project;
CREATE TABLE classifications_nodes_project (
    "structure_id"           uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "structure_name"         ntext,
    "parent_node_id"         numeric,
    "node_id"                numeric,
    "node_code"              ntext,
    "node_name"              ntext,
    "order"                  numeric,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: classifications_structures_account
--
DROP TABLE IF EXISTS classifications_structures_account;
CREATE TABLE classifications_structures_account (
    "structure_id"           uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "structure_name"         ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: classifications_structures_project
--
DROP TABLE IF EXISTS classifications_structures_project;
CREATE TABLE classifications_structures_project (
    "structure_id"           uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "structure_name"         ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

-- =================================================================
-- # Schema: cost
-- =================================================================
--
-- Table: cost_approval_workflows
--
DROP TABLE IF EXISTS cost_approval_workflows;
CREATE TABLE cost_approval_workflows (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "association_id"         uniqueidentifier,
    "association_type"       ntext,
    "current_step_name"      ntext,
    "current_assigned_users" ntext,
    "current_assigned_groups" ntext,
    "reviewed_users"         ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "current_due_date"       datetime
);

--
-- Table: cost_budget_code_segment_codes
--
DROP TABLE IF EXISTS cost_budget_code_segment_codes;
CREATE TABLE cost_budget_code_segment_codes (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "parent_id"              uniqueidentifier,
    "segment_id"             uniqueidentifier,
    "code"                   ntext,
    "original_code"          ntext,
    "description"            ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: cost_budget_code_segments
--
DROP TABLE IF EXISTS cost_budget_code_segments;
CREATE TABLE cost_budget_code_segments (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "length"                 numeric,
    "position"               numeric,
    "type"                   ntext,
    "delimiter"              ntext,
    "sample_code"            ntext,
    "is_variable_length"     bit,
    "is_locked"              bit,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: cost_budget_payment_items
--
DROP TABLE IF EXISTS cost_budget_payment_items;
CREATE TABLE cost_budget_payment_items (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "payment_id"             uniqueidentifier,
    "parent_id"              uniqueidentifier,
    "number"                 ntext,
    "name"                   ntext,
    "description"            ntext,
    "unit"                   ntext,
    "original_amount"        numeric,
    "original_qty"           numeric,
    "original_unit_price"    numeric,
    "amount"                 numeric,
    "unit_price"             numeric,
    "qty"                    numeric,
    "materials_on_store"     numeric,
    "materials_on_store_qty" numeric,
    "materials_on_store_unit_price" numeric,
    "previous_amount"        numeric,
    "previous_qty"           numeric,
    "previous_unit_price"    numeric,
    "previous_materials_on_store" numeric,
    "completed_work_retention_percent" numeric,
    "materials_on_store_retention_percent" numeric,
    "completed_work_released" numeric,
    "materials_on_store_released" numeric,
    "net_amount"             numeric,
    "status"                 ntext,
    "creator_id"             ntext,
    "changed_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: cost_budget_payment_properties
--
DROP TABLE IF EXISTS cost_budget_payment_properties;
CREATE TABLE cost_budget_payment_properties (
    "budget_payment_id"      uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "built_in"               bit,
    "position"               numeric,
    "property_definition_id" uniqueidentifier,
    "type"                   ntext,
    "value"                  ntext
);

--
-- Table: cost_budget_payments
--
DROP TABLE IF EXISTS cost_budget_payments;
CREATE TABLE cost_budget_payments (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "main_contract_id"       uniqueidentifier,
    "start_date"             datetime,
    "end_date"               datetime,
    "due_date"               datetime,
    "number"                 ntext,
    "name"                   ntext,
    "description"            ntext,
    "original_amount"        numeric,
    "amount"                 numeric,
    "previous_amount"        numeric,
    "materials_on_store"     numeric,
    "previous_materials_on_store" numeric,
    "approved_change_orders" numeric,
    "contract_amount"        numeric,
    "completed_work_retention" numeric,
    "materials_on_store_retention" numeric,
    "net_amount"             numeric,
    "paid_amount"            numeric,
    "status"                 ntext,
    "company_id"             ntext,
    "payment_type"           ntext,
    "payment_reference"      ntext,
    "creator_id"             ntext,
    "changed_by"             ntext,
    "contact_id"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "approved_at"            datetime,
    "paid_at"                datetime,
    "submitted_at"           datetime,
    "note"                   ntext,
    "materials_billed"       numeric,
    "materials_retention"    numeric,
    "integration_state"      ntext,
    "integration_state_changed_by" ntext,
    "integration_state_changed_at" datetime,
    "external_id"            ntext,
    "external_system"        ntext,
    "message"                ntext,
    "last_sync_time"         datetime
);

--
-- Table: cost_budget_properties
--
DROP TABLE IF EXISTS cost_budget_properties;
CREATE TABLE cost_budget_properties (
    "budget_id"              uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "built_in"               bit,
    "position"               numeric,
    "property_definition_id" uniqueidentifier,
    "type"                   ntext,
    "value"                  ntext
);

--
-- Table: cost_budget_transfers
--
DROP TABLE IF EXISTS cost_budget_transfers;
CREATE TABLE cost_budget_transfers (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "number"                 ntext,
    "name"                   ntext,
    "note"                   ntext,
    "status"                 ntext,
    "approved_at"            datetime,
    "creator_id"             ntext,
    "changed_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "integration_state"      ntext,
    "integration_state_changed_by" ntext,
    "integration_state_changed_at" datetime,
    "external_id"            ntext,
    "external_system"        ntext,
    "message"                ntext,
    "last_sync_time"         datetime
);

--
-- Table: cost_budgets
--
DROP TABLE IF EXISTS cost_budgets;
CREATE TABLE cost_budgets (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "parent_id"              uniqueidentifier,
    "code"                   ntext,
    "name"                   ntext,
    "description"            ntext,
    "quantity"               numeric,
    "unit_price"             numeric,
    "unit"                   ntext,
    "original_amount"        numeric,
    "internal_adjustment"    numeric,
    "approved_owner_changes" numeric,
    "pending_owner_changes"  numeric,
    "original_commitment"    numeric,
    "approved_change_orders" numeric,
    "approved_in_scope_change_orders" numeric,
    "pending_change_orders"  numeric,
    "reserves"               numeric,
    "actual_cost"            numeric,
    "main_contract_id"       uniqueidentifier,
    "contract_id"            uniqueidentifier,
    "adjustments_total"      numeric,
    "uncommitted"            numeric,
    "revised"                numeric,
    "projected_cost"         numeric,
    "projected_budget"       numeric,
    "forecast_final_cost"    numeric,
    "forecast_variance"      numeric,
    "forecast_cost_complete" numeric,
    "variance_total"         numeric,
    "created_at"             datetime,
    "updated_at"             datetime,
    "original_contracted"    numeric,
    "compounded"             ntext,
    "integration_state"      ntext,
    "integration_state_changed_by" ntext,
    "integration_state_changed_at" datetime,
    "external_id"            ntext,
    "external_system"        ntext,
    "message"                ntext,
    "last_sync_time"         datetime,
    "pending_internal_budget_transfer" numeric,
    "pending_internal_budget_transfer_qty" numeric,
    "pending_internal_budget_transfer_input_qty" numeric,
    "code_segment_values"    ntext,
    "main_contract_item_amount" numeric,
    "approved_cost_payment_application" numeric,
    "approved_budget_payment_application" numeric,
    "locations"              ntext,
    "forecast_adjustment_qty" numeric
);

--
-- Table: cost_change_order_cost_items
--
DROP TABLE IF EXISTS cost_change_order_cost_items;
CREATE TABLE cost_change_order_cost_items (
    "change_order_id"        uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "cost_item_id"           uniqueidentifier
);

--
-- Table: cost_change_order_properties
--
DROP TABLE IF EXISTS cost_change_order_properties;
CREATE TABLE cost_change_order_properties (
    "change_order_id"        uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "built_in"               bit,
    "position"               numeric,
    "property_definition_id" uniqueidentifier,
    "type"                   ntext,
    "value"                  ntext
);

--
-- Table: cost_change_orders
--
DROP TABLE IF EXISTS cost_change_orders;
CREATE TABLE cost_change_orders (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "number"                 ntext,
    "name"                   ntext,
    "description"            ntext,
    "creator_id"             ntext,
    "owner_id"               ntext,
    "changed_by"             ntext,
    "contract_id"            uniqueidentifier,
    "form_type"              ntext,
    "markup_formula_id"      uniqueidentifier,
    "applied_by"             ntext,
    "applied_at"             datetime,
    "budget_status"          ntext,
    "cost_status"            ntext,
    "scope_of_work"          ntext,
    "note"                   ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "type"                   ntext,
    "schedule_change"        numeric,
    "integration_state"      ntext,
    "integration_state_changed_by" ntext,
    "integration_state_changed_at" datetime,
    "external_id"            ntext,
    "external_system"        ntext,
    "message"                ntext,
    "last_sync_time"         datetime,
    "proposed_revised_completion_date" datetime,
    "source_type"            ntext,
    "approved_at"            datetime,
    "status_changed_at"      datetime,
    "main_contract_id"       uniqueidentifier,
    "quantity"               numeric,
    "unit"                   ntext,
    "estimated"              numeric,
    "proposed"               numeric,
    "submitted"              numeric,
    "approved"               numeric,
    "committed"              numeric,
    "compliance_status"      ntext
);

--
-- Table: cost_contract_properties
--
DROP TABLE IF EXISTS cost_contract_properties;
CREATE TABLE cost_contract_properties (
    "contract_id"            uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "built_in"               bit,
    "position"               numeric,
    "property_definition_id" uniqueidentifier,
    "type"                   ntext,
    "value"                  ntext
);

--
-- Table: cost_contracts
--
DROP TABLE IF EXISTS cost_contracts;
CREATE TABLE cost_contracts (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "code"                   ntext,
    "name"                   ntext,
    "description"            ntext,
    "company_id"             ntext,
    "type"                   ntext,
    "contact_id"             ntext,
    "creator_id"             ntext,
    "signed_by"              ntext,
    "owner_id"               ntext,
    "changed_by"             ntext,
    "status"                 ntext,
    "awarded"                numeric,
    "original_budget"        numeric,
    "internal_adjustment"    numeric,
    "approved_owner_changes" numeric,
    "pending_owner_changes"  numeric,
    "approved_change_orders" numeric,
    "approved_in_scope_change_orders" numeric,
    "pending_change_orders"  numeric,
    "reserves"               numeric,
    "actual_cost"            numeric,
    "uncommitted"            numeric,
    "revised"                numeric,
    "projected_cost"         numeric,
    "projected_budget"       numeric,
    "forecast_final_cost"    numeric,
    "forecast_variance"      numeric,
    "forecast_cost_complete" numeric,
    "variance_total"         numeric,
    "awarded_at"             datetime,
    "status_changed_at"      datetime,
    "sent_at"                datetime,
    "responded_at"           datetime,
    "returned_at"            datetime,
    "onsite_at"              datetime,
    "offsite_at"             datetime,
    "procured_at"            datetime,
    "approved_at"            datetime,
    "created_at"             datetime,
    "updated_at"             datetime,
    "scope_of_work"          ntext,
    "note"                   ntext,
    "adjustments_total"      numeric,
    "executed_at"            datetime,
    "currency"               ntext,
    "exchange_rate"          numeric,
    "integration_state"      ntext,
    "integration_state_changed_by" ntext,
    "integration_state_changed_at" datetime,
    "external_id"            ntext,
    "external_system"        ntext,
    "message"                ntext,
    "last_sync_time"         datetime,
    "pending_internal_budget_transfer" numeric,
    "compliance_status"      ntext,
    "awarded_tax_total"      numeric,
    "response_due"           datetime
);

--
-- Table: cost_cost_item_properties
--
DROP TABLE IF EXISTS cost_cost_item_properties;
CREATE TABLE cost_cost_item_properties (
    "cost_item_id"           uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "built_in"               bit,
    "position"               numeric,
    "property_definition_id" uniqueidentifier,
    "type"                   ntext,
    "value"                  ntext
);

--
-- Table: cost_cost_items
--
DROP TABLE IF EXISTS cost_cost_items;
CREATE TABLE cost_cost_items (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "number"                 ntext,
    "name"                   ntext,
    "description"            ntext,
    "budget_id"              uniqueidentifier,
    "budget_status"          ntext,
    "cost_status"            ntext,
    "scope"                  ntext,
    "type"                   ntext,
    "estimated"              numeric,
    "proposed"               numeric,
    "submitted"              numeric,
    "approved"               numeric,
    "committed"              numeric,
    "scope_of_work"          ntext,
    "note"                   ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "schedule_change"        numeric,
    "approved_tax_summary"   ntext,
    "committed_tax_summary"  ntext,
    "estimated_tax_summary"  ntext,
    "proposed_tax_summary"   ntext,
    "submitted_tax_summary"  ntext,
    "is_markup"              bit,
    "quantity"               numeric,
    "unit"                   ntext
);

--
-- Table: cost_cost_payment_items
--
DROP TABLE IF EXISTS cost_cost_payment_items;
CREATE TABLE cost_cost_payment_items (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "payment_id"             uniqueidentifier,
    "parent_id"              uniqueidentifier,
    "number"                 ntext,
    "name"                   ntext,
    "description"            ntext,
    "unit"                   ntext,
    "original_amount"        numeric,
    "original_qty"           numeric,
    "original_unit_price"    numeric,
    "amount"                 numeric,
    "unit_price"             numeric,
    "qty"                    numeric,
    "materials_on_store"     numeric,
    "materials_on_store_qty" numeric,
    "materials_on_store_unit_price" numeric,
    "previous_amount"        numeric,
    "previous_qty"           numeric,
    "previous_unit_price"    numeric,
    "previous_materials_on_store" numeric,
    "completed_work_retention_percent" numeric,
    "materials_on_store_retention_percent" numeric,
    "completed_work_released" numeric,
    "materials_on_store_released" numeric,
    "net_amount"             numeric,
    "status"                 ntext,
    "creator_id"             ntext,
    "changed_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "tax_summary"            ntext
);

--
-- Table: cost_cost_payment_properties
--
DROP TABLE IF EXISTS cost_cost_payment_properties;
CREATE TABLE cost_cost_payment_properties (
    "cost_payment_id"        uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "built_in"               bit,
    "position"               numeric,
    "property_definition_id" uniqueidentifier,
    "type"                   ntext,
    "value"                  ntext
);

--
-- Table: cost_cost_payments
--
DROP TABLE IF EXISTS cost_cost_payments;
CREATE TABLE cost_cost_payments (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "contract_id"            uniqueidentifier,
    "start_date"             datetime,
    "end_date"               datetime,
    "due_date"               datetime,
    "number"                 ntext,
    "name"                   ntext,
    "description"            ntext,
    "original_amount"        numeric,
    "amount"                 numeric,
    "previous_amount"        numeric,
    "materials_on_store"     numeric,
    "previous_materials_on_store" numeric,
    "approved_change_orders" numeric,
    "contract_amount"        numeric,
    "completed_work_retention" numeric,
    "materials_on_store_retention" numeric,
    "net_amount"             numeric,
    "paid_amount"            numeric,
    "status"                 ntext,
    "company_id"             ntext,
    "payment_type"           ntext,
    "payment_reference"      ntext,
    "creator_id"             ntext,
    "changed_by"             ntext,
    "contact_id"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "approved_at"            datetime,
    "paid_at"                datetime,
    "submitted_at"           datetime,
    "note"                   ntext,
    "materials_billed"       numeric,
    "materials_retention"    numeric,
    "integration_state"      ntext,
    "integration_state_changed_by" ntext,
    "integration_state_changed_at" datetime,
    "external_id"            ntext,
    "external_system"        ntext,
    "message"                ntext,
    "last_sync_time"         datetime,
    "tax_summary"            ntext,
    "compliance_status"      ntext
);

--
-- Table: cost_distribution_item_curves
--
DROP TABLE IF EXISTS cost_distribution_item_curves;
CREATE TABLE cost_distribution_item_curves (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "distribution_item_id"   uniqueidentifier,
    "actual_total"           numeric,
    "distribution_total"     numeric,
    "curve"                  ntext,
    "periods"                ntext,
    "actual_total_input_qty" numeric,
    "distribution_total_input_qty" numeric,
    "periods_input_qty"      ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: cost_distribution_items
--
DROP TABLE IF EXISTS cost_distribution_items;
CREATE TABLE cost_distribution_items (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "budget_id"              ntext,
    "association_id"         uniqueidentifier,
    "association_type"       ntext,
    "number"                 ntext,
    "name"                   ntext,
    "status"                 ntext,
    "due_date"               datetime,
    "company_id"             uniqueidentifier,
    "contact_id"             ntext,
    "creator_id"             ntext,
    "changed_by"             ntext,
    "submitted_at"           datetime,
    "accepted_at"            datetime,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: cost_expense_items
--
DROP TABLE IF EXISTS cost_expense_items;
CREATE TABLE cost_expense_items (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "expense_id"             uniqueidentifier,
    "budget_id"              uniqueidentifier,
    "contract_id"            uniqueidentifier,
    "number"                 ntext,
    "name"                   ntext,
    "description"            ntext,
    "unit"                   ntext,
    "unit_price"             numeric,
    "quantity"               numeric,
    "amount"                 numeric,
    "tax"                    numeric,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: cost_expense_properties
--
DROP TABLE IF EXISTS cost_expense_properties;
CREATE TABLE cost_expense_properties (
    "expense_id"             uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "built_in"               bit,
    "position"               numeric,
    "property_definition_id" uniqueidentifier,
    "type"                   ntext,
    "value"                  ntext
);

--
-- Table: cost_expenses
--
DROP TABLE IF EXISTS cost_expenses;
CREATE TABLE cost_expenses (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "number"                 ntext,
    "name"                   ntext,
    "description"            ntext,
    "creator_id"             ntext,
    "changed_by"             ntext,
    "supplier_id"            ntext,
    "supplier_name"          ntext,
    "amount"                 numeric,
    "paid_amount"            numeric,
    "status"                 ntext,
    "type"                   ntext,
    "payment_type"           ntext,
    "payment_reference"      ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "issued_at"              datetime,
    "received_at"            datetime,
    "approved_at"            datetime,
    "paid_at"                datetime,
    "reference_number"       ntext,
    "integration_state"      ntext,
    "integration_state_changed_by" ntext,
    "integration_state_changed_at" datetime,
    "external_id"            ntext,
    "external_system"        ntext,
    "message"                ntext,
    "last_sync_time"         datetime,
    "payment_due"            datetime
);

--
-- Table: cost_main_contract_items
--
DROP TABLE IF EXISTS cost_main_contract_items;
CREATE TABLE cost_main_contract_items (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "main_contract_id"       uniqueidentifier,
    "budget_id"              uniqueidentifier,
    "parent_id"              uniqueidentifier,
    "code"                   ntext,
    "name"                   ntext,
    "description"            ntext,
    "qty"                    numeric,
    "unit_price"             numeric,
    "unit"                   ntext,
    "amount"                 numeric,
    "changed_by"             ntext,
    "is_private"             bit,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: cost_main_contract_properties
--
DROP TABLE IF EXISTS cost_main_contract_properties;
CREATE TABLE cost_main_contract_properties (
    "main_contract_id"       uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "built_in"               bit,
    "position"               numeric,
    "property_definition_id" uniqueidentifier,
    "type"                   ntext,
    "value"                  ntext
);

--
-- Table: cost_main_contracts
--
DROP TABLE IF EXISTS cost_main_contracts;
CREATE TABLE cost_main_contracts (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "code"                   ntext,
    "name"                   ntext,
    "description"            ntext,
    "type"                   ntext,
    "status"                 ntext,
    "amount"                 numeric,
    "retention_cap"          numeric,
    "contact_id"             ntext,
    "creator_id"             ntext,
    "owner_id"               ntext,
    "changed_by"             ntext,
    "scope_of_work"          ntext,
    "note"                   ntext,
    "start_date"             datetime,
    "executed_date"          datetime,
    "planned_completion_date" datetime,
    "actual_completion_date" datetime,
    "close_date"             datetime,
    "created_at"             datetime,
    "updated_at"             datetime,
    "revised_completion_date" datetime,
    "schedule_change"        numeric
);

--
-- Table: cost_payment_references
--
DROP TABLE IF EXISTS cost_payment_references;
CREATE TABLE cost_payment_references (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "amount"                 numeric,
    "type"                   ntext,
    "reference"              ntext,
    "paid_at"                datetime,
    "association_id"         uniqueidentifier,
    "association_type"       ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: cost_permissions
--
DROP TABLE IF EXISTS cost_permissions;
CREATE TABLE cost_permissions (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "policy_id"              uniqueidentifier,
    "subject_id"             ntext,
    "subject_type"           ntext,
    "permission_level"       ntext,
    "resource_type"          ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: cost_schedule_of_values_properties
--
DROP TABLE IF EXISTS cost_schedule_of_values_properties;
CREATE TABLE cost_schedule_of_values_properties (
    "schedule_of_value_id"   uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "built_in"               bit,
    "position"               numeric,
    "property_definition_id" uniqueidentifier,
    "type"                   ntext,
    "value"                  ntext
);

--
-- Table: cost_sub_distribution_items
--
DROP TABLE IF EXISTS cost_sub_distribution_items;
CREATE TABLE cost_sub_distribution_items (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "distribution_item_id"   uniqueidentifier,
    "association_id"         ntext,
    "association_type"       ntext,
    "number"                 ntext,
    "name"                   ntext,
    "start_date"             date,
    "end_date"               date,
    "actual_total"           numeric,
    "distribution_total"     numeric,
    "type"                   ntext,
    "curve"                  ntext,
    "periods"                ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "actual_total_input_qty" numeric,
    "distribution_total_input_qty" numeric,
    "periods_input_qty"      ntext
);

--
-- Table: cost_transferences
--
DROP TABLE IF EXISTS cost_transferences;
CREATE TABLE cost_transferences (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "budget_id"              uniqueidentifier,
    "relating_budget_id"     uniqueidentifier,
    "contract_id"            uniqueidentifier,
    "relating_contract_id"   uniqueidentifier,
    "transaction_id"         uniqueidentifier,
    "amount"                 numeric,
    "unit_price"             numeric,
    "qty"                    numeric,
    "input_qty"              numeric,
    "relating_unit_price"    numeric,
    "relating_qty"           numeric,
    "relating_input_qty"     numeric,
    "creator_id"             ntext,
    "note"                   ntext,
    "main_contract_id"       uniqueidentifier,
    "created_at"             datetime,
    "updated_at"             datetime
);

-- =================================================================
-- # Schema: dailylogs
-- =================================================================
--
-- Table: dailylogs_dailylogs
--
DROP TABLE IF EXISTS dailylogs_dailylogs;
CREATE TABLE dailylogs_dailylogs (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "date"                   datetime,
    "company_id"             ntext,
    "status"                 ntext,
    "created_by"             ntext,
    "updated_by"             ntext,
    "published_by"           ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "published_at"           datetime
);

--
-- Table: dailylogs_labor_items
--
DROP TABLE IF EXISTS dailylogs_labor_items;
CREATE TABLE dailylogs_labor_items (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "company_id"             uniqueidentifier,
    "labor_id"               ntext,
    "company_oxygen_id"      ntext,
    "workers_count"          numeric,
    "total_hours"            numeric,
    "comment"                ntext,
    "created_by"             ntext,
    "updated_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: dailylogs_labors
--
DROP TABLE IF EXISTS dailylogs_labors;
CREATE TABLE dailylogs_labors (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "daily_log_id"           ntext,
    "title"                  ntext,
    "created_by"             ntext,
    "updated_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: dailylogs_notes
--
DROP TABLE IF EXISTS dailylogs_notes;
CREATE TABLE dailylogs_notes (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "daily_log_id"           ntext,
    "title"                  ntext,
    "content"                ntext,
    "created_by"             ntext,
    "updated_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: dailylogs_weather_logs
--
DROP TABLE IF EXISTS dailylogs_weather_logs;
CREATE TABLE dailylogs_weather_logs (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "daily_log_id"           ntext,
    "title"                  ntext,
    "location"               ntext,
    "description"            ntext,
    "highest_temperature"    numeric,
    "highest_temperature_time" datetime,
    "lowest_temperature"     numeric,
    "lowest_temperature_time" datetime,
    "visibility"             numeric,
    "humidity"               numeric,
    "wind"                   numeric,
    "precipitation"          numeric,
    "notes"                  ntext,
    "created_by"             ntext,
    "updated_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

-- =================================================================
-- # Schema: estimates
-- =================================================================
--
-- Table: estimates_cost_markup_formula_bond_levels
--
DROP TABLE IF EXISTS estimates_cost_markup_formula_bond_levels;
CREATE TABLE estimates_cost_markup_formula_bond_levels (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "item_id"                uniqueidentifier,
    "order"                  numeric,
    "amount"                 numeric,
    "percentage"             numeric,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: estimates_cost_markup_formula_items
--
DROP TABLE IF EXISTS estimates_cost_markup_formula_items;
CREATE TABLE estimates_cost_markup_formula_items (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "section_id"             uniqueidentifier,
    "description"            ntext,
    "order"                  numeric,
    "markup_type"            ntext,
    "cost_basis_source"      ntext,
    "cost_basis_section_id"  uniqueidentifier,
    "amount"                 numeric,
    "percentage"             numeric,
    "total"                  numeric,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: estimates_cost_markup_formula_sections
--
DROP TABLE IF EXISTS estimates_cost_markup_formula_sections;
CREATE TABLE estimates_cost_markup_formula_sections (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "formula_id"             uniqueidentifier,
    "description"            ntext,
    "order"                  numeric,
    "total"                  numeric,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: estimates_cost_markup_formulas
--
DROP TABLE IF EXISTS estimates_cost_markup_formulas;
CREATE TABLE estimates_cost_markup_formulas (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "total"                  numeric,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: estimates_equipment_cost_calculations
--
DROP TABLE IF EXISTS estimates_equipment_cost_calculations;
CREATE TABLE estimates_equipment_cost_calculations (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "equipment_type"         ntext,
    "rate"                   numeric,
    "productivity"           numeric,
    "productivity_unit"      ntext,
    "rounding"               ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: estimates_estimation_instances
--
DROP TABLE IF EXISTS estimates_estimation_instances;
CREATE TABLE estimates_estimation_instances (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "unit_of_measure"        ntext,
    "part_number"            ntext,
    "barcode"                ntext,
    "quantity"               numeric,
    "takeoff_instance_count" numeric,
    "material_cost_calculation_id" uniqueidentifier,
    "material_cost_total"    numeric,
    "labor_cost_calculation_id" uniqueidentifier,
    "labor_cost_total"       numeric,
    "equipment_cost_calculation_id" uniqueidentifier,
    "equipment_cost_total"   numeric,
    "other_cost_rate"        numeric,
    "other_cost_total"       numeric,
    "subcontractor_cost_rate" numeric,
    "subcontractor_cost_total" numeric,
    "total_cost"             numeric,
    "markup_total"           numeric,
    "classification1_id"     uniqueidentifier,
    "classification2_id"     uniqueidentifier,
    "content_lineage_id"     uniqueidentifier,
    "package_id"             uniqueidentifier,
    "location_id"            uniqueidentifier,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: estimates_labor_cost_calculations
--
DROP TABLE IF EXISTS estimates_labor_cost_calculations;
CREATE TABLE estimates_labor_cost_calculations (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "labor_type"             ntext,
    "rate_type"              ntext,
    "rate"                   numeric,
    "daily_hours"            numeric,
    "productivity"           numeric,
    "productivity_unit"      ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: estimates_material_cost_calculations
--
DROP TABLE IF EXISTS estimates_material_cost_calculations;
CREATE TABLE estimates_material_cost_calculations (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "rate"                   numeric,
    "factor"                 numeric,
    "factor_unit"            ntext,
    "waste_percentage"       numeric,
    "rounding"               ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: estimates_settings
--
DROP TABLE IF EXISTS estimates_settings;
CREATE TABLE estimates_settings (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "measurement_system"     ntext,
    "currency"               ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

-- =================================================================
-- # Schema: forms
-- =================================================================
--
-- Table: forms_form_attachments
--
DROP TABLE IF EXISTS forms_form_attachments;
CREATE TABLE forms_form_attachments (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "form_id"                uniqueidentifier,
    "attachment_id"          uniqueidentifier,
    "attachment_type"        ntext,
    "item_urn"               ntext,
    "is_deleted"             bit,
    "updated_by"             ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: forms_form_files
--
DROP TABLE IF EXISTS forms_form_files;
CREATE TABLE forms_form_files (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "form_id"                uniqueidentifier,
    "extracted_form_data"    ntext
);

--
-- Table: forms_form_sections
--
DROP TABLE IF EXISTS forms_form_sections;
CREATE TABLE forms_form_sections (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "form_uid"               uniqueidentifier,
    "status"                 ntext,
    "assignee_id"            ntext,
    "assignee_type"          ntext,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "user_created_at"        datetime,
    "last_completed_by"      ntext,
    "last_completed_at"      datetime,
    "last_reopened_by"       ntext,
    "last_reopened_at"       datetime
);

--
-- Table: forms_form_templates
--
DROP TABLE IF EXISTS forms_form_templates;
CREATE TABLE forms_form_templates (
    "created_by"             ntext,
    "updated_at"             datetime,
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "status"                 ntext,
    "file_id"                uniqueidentifier,
    "native_form_id"         uniqueidentifier,
    "template_type"          ntext
);

--
-- Table: forms_forms
--
DROP TABLE IF EXISTS forms_forms;
CREATE TABLE forms_forms (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "template_id"            uniqueidentifier,
    "status"                 ntext,
    "assignee_id"            ntext,
    "number"                 numeric,
    "form_date"              date,
    "notes"                  ntext,
    "description"            ntext,
    "weather_id"             numeric,
    "native_form_id"         uniqueidentifier,
    "file_id"                uniqueidentifier,
    "created_by"             ntext,
    "updated_at"             datetime,
    "location_id"            uniqueidentifier,
    "last_reopened_by"       uniqueidentifier,
    "last_submitter_signature" ntext,
    "due_date"               date,
    "created_at"             datetime,
    "last_submitted_at"      datetime,
    "assignee_type_id"       ntext,
    "assignee_type"          ntext,
    "name"                   ntext,
    "last_submitted_by"      ntext
);

--
-- Table: forms_layout_section_items
--
DROP TABLE IF EXISTS forms_layout_section_items;
CREATE TABLE forms_layout_section_items (
    "uid"                    uniqueidentifier,
    "layout_uid"             uniqueidentifier,
    "section_uid"            uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "sort_index"             numeric,
    "label"                  ntext,
    "schema"                 ntext,
    "value_name"             ntext,
    "description"            ntext,
    "is_required"            bit,
    "modifier"               ntext,
    "presets"                ntext,
    "type"                   ntext,
    "display_index"          numeric,
    "field_id_v2"            uniqueidentifier
);

--
-- Table: forms_layout_sections
--
DROP TABLE IF EXISTS forms_layout_sections;
CREATE TABLE forms_layout_sections (
    "uid"                    uniqueidentifier,
    "layout_uid"             uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "sort_index"             numeric,
    "label"                  ntext,
    "description"            ntext,
    "form_section_id"        uniqueidentifier,
    "assignee_id"            ntext,
    "assignee_type"          ntext,
    "display_index"          numeric
);

--
-- Table: forms_layout_table_columns
--
DROP TABLE IF EXISTS forms_layout_table_columns;
CREATE TABLE forms_layout_table_columns (
    "uid"                    uniqueidentifier,
    "layout_uid"             uniqueidentifier,
    "section_item_uid"       uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "sort_index"             numeric,
    "presets"                ntext,
    "value_name"             ntext,
    "values_provider"        ntext,
    "label"                  ntext,
    "column_key"             ntext,
    "column_type"            ntext,
    "expression"             ntext
);

--
-- Table: forms_layouts
--
DROP TABLE IF EXISTS forms_layouts;
CREATE TABLE forms_layouts (
    "uid"                    uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "description"            ntext,
    "has_section_assignees"  bit,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "user_created_at"        datetime,
    "sequential_section_completion" bit
);

--
-- Table: forms_native_form_section_item_attachments
--
DROP TABLE IF EXISTS forms_native_form_section_item_attachments;
CREATE TABLE forms_native_form_section_item_attachments (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "native_form_id"         uniqueidentifier,
    "section_item_uid"       uniqueidentifier,
    "attachment_id"          uniqueidentifier,
    "attachment_type"        ntext,
    "item_urn"               ntext,
    "is_deleted"             bit,
    "updated_by"             ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: forms_native_form_tabular_values
--
DROP TABLE IF EXISTS forms_native_form_tabular_values;
CREATE TABLE forms_native_form_tabular_values (
    "native_form_id"         uniqueidentifier,
    "layout_table_column_id" uniqueidentifier,
    "layout_section_item_id" uniqueidentifier,
    "native_form_value_id"   uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "field_id"               ntext,
    "text_val"               ntext,
    "number_val"             numeric,
    "integer_val"            numeric,
    "array_val"              ntext,
    "uid_val"                uniqueidentifier,
    "svg_val"                ntext,
    "timespan_val"           ntext,
    "datetime_local_val"     datetime,
    "datetime_utc_val"       datetime,
    "timezone_val"           ntext,
    "lat_val"                numeric,
    "lng_val"                numeric,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "date_val"               date,
    "time_val"               time,
    "field_id_v2"            uniqueidentifier
);

--
-- Table: forms_native_form_values
--
DROP TABLE IF EXISTS forms_native_form_values;
CREATE TABLE forms_native_form_values (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "native_form_id"         uniqueidentifier,
    "rank"                   numeric,
    "field_id"               ntext,
    "notes"                  ntext,
    "name"                   ntext,
    "svg_val"                ntext,
    "array_val"              ntext,
    "number_val"             numeric,
    "text_val"               ntext,
    "choice_val"             ntext,
    "toggle_val"             numeric,
    "date_val"               date,
    "description"            ntext,
    "item"                   ntext,
    "quantity"               numeric,
    "unit"                   ntext,
    "timespan"               ntext,
    "trade"                  ntext,
    "headcount"              numeric,
    "company_id"             uniqueidentifier,
    "role_id"                uniqueidentifier,
    "ot_timespan"            ntext,
    "role_name"              ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "field_id_v2"            uniqueidentifier
);

--
-- Table: forms_native_forms
--
DROP TABLE IF EXISTS forms_native_forms;
CREATE TABLE forms_native_forms (
    "updated_at"             datetime,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "id"                     uniqueidentifier,
    "template_id"            uniqueidentifier,
    "layout_uid"             uniqueidentifier
);

--
-- Table: forms_weather
--
DROP TABLE IF EXISTS forms_weather;
CREATE TABLE forms_weather (
    "id"                     numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "date"                   date,
    "summary_key"            ntext,
    "temperature_min"        numeric,
    "temperature_max"        numeric,
    "humidity"               numeric,
    "wind_speed"             numeric,
    "wind_gust"              numeric,
    "wind_bearing"           numeric,
    "fetched_at"             datetime,
    "precipitation_accumulation" numeric
);

--
-- Table: forms_weather_hours
--
DROP TABLE IF EXISTS forms_weather_hours;
CREATE TABLE forms_weather_hours (
    "weather_id"             numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "hour"                   time,
    "summary_key"            ntext,
    "temp"                   numeric,
    "wind_speed"             numeric,
    "wind_bearing"           numeric,
    "humidity"               numeric,
    "fetched_at"             datetime,
    "created_at"             datetime,
    "updated_at"             datetime
);

-- =================================================================
-- # Schema: iq
-- =================================================================
--
-- Table: iq_company_daily_quality_risk_changes
--
DROP TABLE IF EXISTS iq_company_daily_quality_risk_changes;
CREATE TABLE iq_company_daily_quality_risk_changes (
    "id"                     uniqueidentifier,
    "company_id"             uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "start_time"             datetime,
    "daily_risk"             ntext,
    "daily_risk_indicator"   numeric,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: iq_company_daily_safety_risk_changes
--
DROP TABLE IF EXISTS iq_company_daily_safety_risk_changes;
CREATE TABLE iq_company_daily_safety_risk_changes (
    "id"                     uniqueidentifier,
    "company_id"             uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "start_date"             datetime,
    "daily_safety_risk"      numeric,
    "daily_safety_risk_indicator" numeric,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: iq_cost_impact_issues
--
DROP TABLE IF EXISTS iq_cost_impact_issues;
CREATE TABLE iq_cost_impact_issues (
    "id"                     uniqueidentifier,
    "updated_at"             datetime,
    "predicted_at"           datetime,
    "cost_impact"            ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier
);

--
-- Table: iq_design_issues_building_components
--
DROP TABLE IF EXISTS iq_design_issues_building_components;
CREATE TABLE iq_design_issues_building_components (
    "id"                     uniqueidentifier,
    "updated_at"             datetime,
    "predicted_at"           datetime,
    "building_component"     ntext,
    "user_building_component" ntext,
    "building_component_keyword" ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier
);

--
-- Table: iq_design_issues_root_cause
--
DROP TABLE IF EXISTS iq_design_issues_root_cause;
CREATE TABLE iq_design_issues_root_cause (
    "id"                     uniqueidentifier,
    "updated_at"             datetime,
    "predicted_at"           datetime,
    "root_cause"             ntext,
    "user_root_cause"        ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier
);

--
-- Table: iq_inspection_risk_issues
--
DROP TABLE IF EXISTS iq_inspection_risk_issues;
CREATE TABLE iq_inspection_risk_issues (
    "id"                     uniqueidentifier,
    "updated_at"             datetime,
    "predicted_at"           datetime,
    "inspection_risk"        bit,
    "user_category"          ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier
);

--
-- Table: iq_issues_quality_categories
--
DROP TABLE IF EXISTS iq_issues_quality_categories;
CREATE TABLE iq_issues_quality_categories (
    "id"                     uniqueidentifier,
    "predicted_at"           datetime,
    "updated_at"             datetime,
    "category"               ntext,
    "user_category"          ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier
);

--
-- Table: iq_issues_quality_risks
--
DROP TABLE IF EXISTS iq_issues_quality_risks;
CREATE TABLE iq_issues_quality_risks (
    "id"                     uniqueidentifier,
    "predicted_at"           datetime,
    "risk"                   ntext,
    "updated_at"             datetime,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "user_risk"              ntext
);

--
-- Table: iq_issues_safety_hazard
--
DROP TABLE IF EXISTS iq_issues_safety_hazard;
CREATE TABLE iq_issues_safety_hazard (
    "id"                     uniqueidentifier,
    "updated_at"             datetime,
    "predicted_at"           datetime,
    "safety_hazard_category" ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier
);

--
-- Table: iq_issues_safety_observations
--
DROP TABLE IF EXISTS iq_issues_safety_observations;
CREATE TABLE iq_issues_safety_observations (
    "id"                     uniqueidentifier,
    "updated_at"             datetime,
    "predicted_at"           datetime,
    "safety_observation_category" ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier
);

--
-- Table: iq_issues_safety_risk
--
DROP TABLE IF EXISTS iq_issues_safety_risk;
CREATE TABLE iq_issues_safety_risk (
    "id"                     uniqueidentifier,
    "updated_at"             datetime,
    "predicted_at"           datetime,
    "safety_risk_category"   ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier
);

--
-- Table: iq_project_daily_quality_risk_changes
--
DROP TABLE IF EXISTS iq_project_daily_quality_risk_changes;
CREATE TABLE iq_project_daily_quality_risk_changes (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "start_time"             datetime,
    "daily_risk"             ntext,
    "daily_risk_indicator"   numeric,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: iq_rfis_building_components
--
DROP TABLE IF EXISTS iq_rfis_building_components;
CREATE TABLE iq_rfis_building_components (
    "id"                     uniqueidentifier,
    "updated_at"             datetime,
    "predicted_at"           datetime,
    "building_component"     ntext,
    "building_component_keyword" ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier
);

--
-- Table: iq_rfis_disciplines
--
DROP TABLE IF EXISTS iq_rfis_disciplines;
CREATE TABLE iq_rfis_disciplines (
    "id"                     uniqueidentifier,
    "updated_at"             datetime,
    "predicted_at"           datetime,
    "discipline"             ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier
);

--
-- Table: iq_rfis_high_risk
--
DROP TABLE IF EXISTS iq_rfis_high_risk;
CREATE TABLE iq_rfis_high_risk (
    "id"                     uniqueidentifier,
    "updated_at"             datetime,
    "predicted_at"           datetime,
    "risk"                   ntext,
    "score"                  numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier
);

--
-- Table: iq_rfis_root_cause
--
DROP TABLE IF EXISTS iq_rfis_root_cause;
CREATE TABLE iq_rfis_root_cause (
    "id"                     uniqueidentifier,
    "updated_at"             datetime,
    "predicted_at"           datetime,
    "root_cause"             ntext,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier
);

-- =================================================================
-- # Schema: issues
-- =================================================================
--
-- Table: issues_attachments
--
DROP TABLE IF EXISTS issues_attachments;
CREATE TABLE issues_attachments (
    "attachment_id"          uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "issue_id"               uniqueidentifier,
    "display_name"           ntext,
    "file_name"              ntext,
    "storage_urn"            ntext,
    "file_size"              numeric,
    "file_type"              ntext,
    "lineage_urn"            ntext,
    "version"                numeric,
    "version_urn"            ntext,
    "tip_version_urn"        ntext,
    "bubble_urn"             ntext,
    "created_at"             datetime,
    "created_by"             ntext,
    "deleted_at"             datetime,
    "deleted_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext
);

--
-- Table: issues_checklist_mappings
--
DROP TABLE IF EXISTS issues_checklist_mappings;
CREATE TABLE issues_checklist_mappings (
    "issue_id"               uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "checklist_id"           ntext,
    "checklist_item"         ntext,
    "checklist_section"      ntext
);

--
-- Table: issues_comments
--
DROP TABLE IF EXISTS issues_comments;
CREATE TABLE issues_comments (
    "comment_id"             uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "issue_id"               uniqueidentifier,
    "comment_body"           ntext,
    "created_by"             ntext,
    "created_at"             datetime
);

--
-- Table: issues_custom_attribute_list_values
--
DROP TABLE IF EXISTS issues_custom_attribute_list_values;
CREATE TABLE issues_custom_attribute_list_values (
    "attribute_mappings_id"  uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "list_id"                uniqueidentifier,
    "list_value"             ntext
);

--
-- Table: issues_custom_attributes
--
DROP TABLE IF EXISTS issues_custom_attributes;
CREATE TABLE issues_custom_attributes (
    "issue_id"               uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "mapped_item_type"       ntext,
    "attribute_mapping_id"   uniqueidentifier,
    "attribute_title"        ntext,
    "attribute_description"  ntext,
    "attribute_data_type"    ntext,
    "is_required"            bit,
    "attribute_value"        ntext
);

--
-- Table: issues_custom_attributes_mappings
--
DROP TABLE IF EXISTS issues_custom_attributes_mappings;
CREATE TABLE issues_custom_attributes_mappings (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "mapped_item_type"       ntext,
    "mapped_item_id"         uniqueidentifier,
    "title"                  ntext,
    "description"            ntext,
    "data_type"              ntext,
    "order"                  numeric,
    "is_required"            bit,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext
);

--
-- Table: issues_issue_subtypes
--
DROP TABLE IF EXISTS issues_issue_subtypes;
CREATE TABLE issues_issue_subtypes (
    "issue_subtype_id"       uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "issue_type_id"          uniqueidentifier,
    "issue_subtype"          ntext,
    "is_active"              bit,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "deleted_by"             ntext,
    "deleted_at"             datetime
);

--
-- Table: issues_issue_types
--
DROP TABLE IF EXISTS issues_issue_types;
CREATE TABLE issues_issue_types (
    "issue_type_id"          uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "issue_type"             ntext,
    "is_active"              bit,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "deleted_by"             ntext,
    "deleted_at"             datetime
);

--
-- Table: issues_issues
--
DROP TABLE IF EXISTS issues_issues;
CREATE TABLE issues_issues (
    "issue_id"               uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "display_id"             numeric,
    "title"                  ntext,
    "description"            ntext,
    "type_id"                uniqueidentifier,
    "subtype_id"             uniqueidentifier,
    "status"                 ntext,
    "assignee_id"            ntext,
    "assignee_type"          ntext,
    "due_date"               datetime,
    "location_id"            uniqueidentifier,
    "location_details"       ntext,
    "linked_document_urn"    ntext,
    "owner_id"               ntext,
    "root_cause_id"          uniqueidentifier,
    "root_cause_category_id" uniqueidentifier,
    "response"               ntext,
    "response_by"            ntext,
    "response_at"            datetime,
    "opened_by"              ntext,
    "opened_at"              datetime,
    "closed_by"              ntext,
    "closed_at"              datetime,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "start_date"             datetime,
    "deleted_at"             datetime,
    "snapshot_urn"           ntext,
    "published"              bit,
    "gps_coordinates"        ntext,
    "deleted_by"             ntext
);

--
-- Table: issues_placements
--
DROP TABLE IF EXISTS issues_placements;
CREATE TABLE issues_placements (
    "placement_id"           uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "issue_id"               uniqueidentifier,
    "lineage_urn"            ntext,
    "type"                   ntext,
    "created_at_version"     numeric,
    "origin_product"         ntext,
    "origin_tool"            ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "deleted_by"             ntext,
    "deleted_at"             datetime
);

--
-- Table: issues_root_cause_categories
--
DROP TABLE IF EXISTS issues_root_cause_categories;
CREATE TABLE issues_root_cause_categories (
    "root_cause_category_id" uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "root_cause_category"    ntext,
    "is_active"              bit,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "deleted_by"             ntext,
    "deleted_at"             datetime,
    "is_system"              bit
);

--
-- Table: issues_root_causes
--
DROP TABLE IF EXISTS issues_root_causes;
CREATE TABLE issues_root_causes (
    "root_cause_id"          uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "root_cause_category_id" uniqueidentifier,
    "title"                  ntext,
    "is_active"              bit,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "deleted_by"             ntext,
    "deleted_at"             datetime,
    "is_system"              bit
);

--
-- Table: issues_viewables
--
DROP TABLE IF EXISTS issues_viewables;
CREATE TABLE issues_viewables (
    "placement_id"           uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "issue_id"               uniqueidentifier,
    "file_version"           numeric,
    "file_version_urn"       ntext,
    "guid"                   ntext,
    "name"                   ntext,
    "viewable_id"            ntext,
    "is_3d"                  bit,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime
);

-- =================================================================
-- # Schema: issuesbim360
-- =================================================================
--
-- Table: issuesbim360_attachments
--
DROP TABLE IF EXISTS issuesbim360_attachments;
CREATE TABLE issuesbim360_attachments (
    "attachment_id"          uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "issue_id"               uniqueidentifier,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "attachment_type"        ntext,
    "attachment_name"        ntext
);

--
-- Table: issuesbim360_checklist_mappings
--
DROP TABLE IF EXISTS issuesbim360_checklist_mappings;
CREATE TABLE issuesbim360_checklist_mappings (
    "issue_id"               uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "checklist_id"           ntext,
    "checklist_item"         ntext,
    "checklist_section"      ntext
);

--
-- Table: issuesbim360_comments
--
DROP TABLE IF EXISTS issuesbim360_comments;
CREATE TABLE issuesbim360_comments (
    "comment_id"             uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "issue_id"               uniqueidentifier,
    "comment_body"           ntext,
    "created_by"             ntext,
    "created_at"             datetime
);

--
-- Table: issuesbim360_custom_attribute_list_values
--
DROP TABLE IF EXISTS issuesbim360_custom_attribute_list_values;
CREATE TABLE issuesbim360_custom_attribute_list_values (
    "attribute_mappings_id"  uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "list_id"                uniqueidentifier,
    "list_value"             ntext
);

--
-- Table: issuesbim360_custom_attributes
--
DROP TABLE IF EXISTS issuesbim360_custom_attributes;
CREATE TABLE issuesbim360_custom_attributes (
    "issue_id"               uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "mapped_item_type"       ntext,
    "attribute_mapping_id"   uniqueidentifier,
    "attribute_title"        ntext,
    "attribute_description"  ntext,
    "attribute_data_type"    ntext,
    "is_required"            bit,
    "attribute_value"        ntext
);

--
-- Table: issuesbim360_custom_attributes_mappings
--
DROP TABLE IF EXISTS issuesbim360_custom_attributes_mappings;
CREATE TABLE issuesbim360_custom_attributes_mappings (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "mapped_item_type"       ntext,
    "mapped_item_id"         uniqueidentifier,
    "title"                  ntext,
    "description"            ntext,
    "data_type"              ntext,
    "order"                  numeric,
    "is_required"            bit,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext
);

--
-- Table: issuesbim360_issue_subtypes
--
DROP TABLE IF EXISTS issuesbim360_issue_subtypes;
CREATE TABLE issuesbim360_issue_subtypes (
    "issue_subtype_id"       uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "issue_type_id"          uniqueidentifier,
    "issue_subtype"          ntext,
    "is_active"              bit,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "deleted_by"             ntext,
    "deleted_at"             datetime
);

--
-- Table: issuesbim360_issue_types
--
DROP TABLE IF EXISTS issuesbim360_issue_types;
CREATE TABLE issuesbim360_issue_types (
    "issue_type_id"          uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "issue_type"             ntext,
    "is_active"              bit,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "deleted_by"             ntext,
    "deleted_at"             datetime
);

--
-- Table: issuesbim360_issues
--
DROP TABLE IF EXISTS issuesbim360_issues;
CREATE TABLE issuesbim360_issues (
    "issue_id"               uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "display_id"             numeric,
    "title"                  ntext,
    "description"            ntext,
    "type_id"                uniqueidentifier,
    "subtype_id"             uniqueidentifier,
    "status"                 ntext,
    "assignee_id"            ntext,
    "assignee_type"          ntext,
    "due_date"               datetime,
    "location_id"            uniqueidentifier,
    "location_details"       ntext,
    "linked_document_urn"    ntext,
    "owner_id"               ntext,
    "root_cause_id"          uniqueidentifier,
    "root_cause_category_id" uniqueidentifier,
    "response"               ntext,
    "response_by"            ntext,
    "response_at"            datetime,
    "opened_by"              ntext,
    "opened_at"              datetime,
    "closed_by"              ntext,
    "closed_at"              datetime,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "start_date"             datetime,
    "deleted_at"             datetime,
    "snapshot_urn"           ntext,
    "published"              bit,
    "gps_coordinates"        ntext,
    "deleted_by"             ntext
);

--
-- Table: issuesbim360_root_cause_categories
--
DROP TABLE IF EXISTS issuesbim360_root_cause_categories;
CREATE TABLE issuesbim360_root_cause_categories (
    "root_cause_category_id" uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "root_cause_category"    ntext,
    "is_active"              bit,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "deleted_by"             ntext,
    "deleted_at"             datetime,
    "is_system"              bit
);

--
-- Table: issuesbim360_root_causes
--
DROP TABLE IF EXISTS issuesbim360_root_causes;
CREATE TABLE issuesbim360_root_causes (
    "root_cause_id"          uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "root_cause_category_id" uniqueidentifier,
    "title"                  ntext,
    "is_active"              bit,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "deleted_by"             ntext,
    "deleted_at"             datetime,
    "is_system"              bit
);

-- =================================================================
-- # Schema: locations
-- =================================================================
--
-- Table: locations_nodes
--
DROP TABLE IF EXISTS locations_nodes;
CREATE TABLE locations_nodes (
    "tree_id"                uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "parent_id"              uniqueidentifier,
    "id"                     uniqueidentifier,
    "name"                   ntext,
    "order"                  numeric,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: locations_trees
--
DROP TABLE IF EXISTS locations_trees;
CREATE TABLE locations_trees (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

-- =================================================================
-- # Schema: markups
-- =================================================================
--
-- Table: markups_layer
--
DROP TABLE IF EXISTS markups_layer;
CREATE TABLE markups_layer (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "uid"                    uniqueidentifier,
    "surface_uid"            uniqueidentifier,
    "name"                   ntext,
    "promotable"             bit,
    "surface_type"           ntext,
    "base_entity_urn"        ntext,
    "base_entity_uid"        uniqueidentifier
);

--
-- Table: markups_link
--
DROP TABLE IF EXISTS markups_link;
CREATE TABLE markups_link (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "uid"                    uniqueidentifier,
    "markup_id"              numeric,
    "type"                   ntext,
    "destination"            uniqueidentifier,
    "uri"                    ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "deleted"                bit,
    "deleted_by"             ntext,
    "deleted_at"             datetime
);

--
-- Table: markups_markup
--
DROP TABLE IF EXISTS markups_markup;
CREATE TABLE markups_markup (
    "id"                     numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "uid"                    uniqueidentifier,
    "feature_bound_uid"      uniqueidentifier,
    "feature_bound_type"     ntext,
    "type"                   ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "deleted"                bit,
    "deleted_by"             ntext,
    "deleted_at"             datetime,
    "markup_text"            ntext
);

--
-- Table: markups_placement
--
DROP TABLE IF EXISTS markups_placement;
CREATE TABLE markups_placement (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "markup_uid"             uniqueidentifier,
    "surface_uid"            uniqueidentifier,
    "published"              bit,
    "layer_uid"              uniqueidentifier,
    "id"                     numeric,
    "uid"                    uniqueidentifier,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "deleted"                bit,
    "deleted_by"             ntext,
    "deleted_at"             datetime,
    "placement_text"         ntext
);

-- =================================================================
-- # Schema: meetingminutes
-- =================================================================
--
-- Table: meetingminutes_assignees
--
DROP TABLE IF EXISTS meetingminutes_assignees;
CREATE TABLE meetingminutes_assignees (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "item_id"                uniqueidentifier,
    "participant_id"         uniqueidentifier,
    "non_member_participant_id" uniqueidentifier,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime
);

--
-- Table: meetingminutes_attachments
--
DROP TABLE IF EXISTS meetingminutes_attachments;
CREATE TABLE meetingminutes_attachments (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "item_id"                uniqueidentifier,
    "meeting_id"             uniqueidentifier,
    "uri"                    ntext,
    "origin"                 ntext,
    "name"                   ntext,
    "created_by"             ntext,
    "updated_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime
);

--
-- Table: meetingminutes_items
--
DROP TABLE IF EXISTS meetingminutes_items;
CREATE TABLE meetingminutes_items (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "topic_id"               uniqueidentifier,
    "order_index"            numeric,
    "description"            ntext,
    "status"                 ntext,
    "cross_series_id"        uniqueidentifier,
    "due_date"               datetime,
    "created_by"             ntext,
    "updated_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime
);

--
-- Table: meetingminutes_meetings
--
DROP TABLE IF EXISTS meetingminutes_meetings;
CREATE TABLE meetingminutes_meetings (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "series_id"              uniqueidentifier,
    "title"                  ntext,
    "description"            ntext,
    "summary"                ntext,
    "status"                 ntext,
    "num_in_series"          numeric,
    "meeting_location"       ntext,
    "starts_at"              datetime,
    "duration"               numeric,
    "video_conference_link"  ntext,
    "created_by"             ntext,
    "updated_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime
);

--
-- Table: meetingminutes_non_member_participants
--
DROP TABLE IF EXISTS meetingminutes_non_member_participants;
CREATE TABLE meetingminutes_non_member_participants (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "meeting_id"             uniqueidentifier,
    "first_name"             ntext,
    "last_name"              ntext,
    "company"                ntext,
    "email"                  ntext,
    "status"                 ntext,
    "created_by"             ntext,
    "updated_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime
);

--
-- Table: meetingminutes_participants
--
DROP TABLE IF EXISTS meetingminutes_participants;
CREATE TABLE meetingminutes_participants (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "meeting_id"             uniqueidentifier,
    "autodesk_id"            ntext,
    "type"                   ntext,
    "status"                 ntext,
    "created_by"             ntext,
    "updated_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime
);

--
-- Table: meetingminutes_topics
--
DROP TABLE IF EXISTS meetingminutes_topics;
CREATE TABLE meetingminutes_topics (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "meeting_id"             uniqueidentifier,
    "order_index"            numeric,
    "name"                   ntext,
    "created_by"             ntext,
    "updated_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime
);

-- =================================================================
-- # Schema: packages
-- =================================================================
--
-- Table: packages_package_associations
--
DROP TABLE IF EXISTS packages_package_associations;
CREATE TABLE packages_package_associations (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "package_id"             uniqueidentifier,
    "version_id"             uniqueidentifier
);

--
-- Table: packages_package_roles
--
DROP TABLE IF EXISTS packages_package_roles;
CREATE TABLE packages_package_roles (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "adsk_id"                ntext,
    "adsk_id_type"           ntext,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "status"                 ntext
);

--
-- Table: packages_packages
--
DROP TABLE IF EXISTS packages_packages;
CREATE TABLE packages_packages (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "locked"                 bit,
    "locked_at"              datetime,
    "locked_by"              ntext,
    "name"                   ntext,
    "description"            ntext,
    "resource_count"         numeric,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "version_resource_option" ntext
);

--
-- Table: packages_version_resources
--
DROP TABLE IF EXISTS packages_version_resources;
CREATE TABLE packages_version_resources (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "version_id"             uniqueidentifier,
    "urn"                    ntext,
    "version"                numeric,
    "revision"               numeric,
    "file_type"              ntext,
    "path"                   ntext,
    "trashed"                bit,
    "name"                   ntext,
    "file_size"              numeric,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext
);

-- =================================================================
-- # Schema: photos
-- =================================================================
--
-- Table: photos_photo_tags
--
DROP TABLE IF EXISTS photos_photo_tags;
CREATE TABLE photos_photo_tags (
    "id"                     numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "seq_id"                 numeric,
    "project_id"             ntext,
    "photo_id"               ntext,
    "tag_name"               ntext,
    "tag_type"               ntext,
    "created_at"             datetime,
    "creator_id"             ntext,
    "deleted_at"             datetime,
    "deleter_id"             ntext,
    "model_version"          numeric
);

--
-- Table: photos_photos
--
DROP TABLE IF EXISTS photos_photos;
CREATE TABLE photos_photos (
    "id"                     numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "title"                  ntext,
    "size"                   numeric,
    "status"                 ntext,
    "annotation"             ntext,
    "punch"                  ntext,
    "creator_id"             ntext,
    "deleter_id"             ntext,
    "updater_id"             ntext,
    "lat"                    numeric,
    "lng"                    numeric,
    "uid"                    ntext,
    "description"            ntext,
    "image_type"             ntext,
    "type"                   ntext,
    "taken_on"               datetime,
    "locked_at"              datetime,
    "is_public"              bit,
    "created_at"             datetime,
    "user_created_at"        datetime,
    "updated_on"             datetime,
    "deleted_at"             datetime,
    "project"                ntext,
    "seq_id"                 numeric,
    "sheet"                  ntext
);

--
-- Table: photos_referencer_participants
--
DROP TABLE IF EXISTS photos_referencer_participants;
CREATE TABLE photos_referencer_participants (
    "id"                     numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "project_id"             ntext,
    "referencer_urn"         ntext,
    "participant_id"         ntext,
    "participant_type"       ntext,
    "created_at"             datetime
);

--
-- Table: photos_referencer_photos
--
DROP TABLE IF EXISTS photos_referencer_photos;
CREATE TABLE photos_referencer_photos (
    "id"                     numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "project_id"             ntext,
    "referencer_urn"         ntext,
    "photo_id"               ntext,
    "created_at"             datetime,
    "edge_urn"               ntext
);

-- =================================================================
-- # Schema: relationships
-- =================================================================
--
-- Table: relationships_entity_relationship
--
DROP TABLE IF EXISTS relationships_entity_relationship;
CREATE TABLE relationships_entity_relationship (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "relationship_guid"      uniqueidentifier,
    "item1_domain"           ntext,
    "item1_entitytype"       ntext,
    "item1_id"               ntext,
    "item2_domain"           ntext,
    "item2_entitytype"       ntext,
    "item2_id"               ntext,
    "created_on"             datetime,
    "deleted_on"             datetime,
    "is_deleted"             bit,
    "is_service_owned"       bit
);

-- =================================================================
-- # Schema: reviews
-- =================================================================
--
-- Table: reviews_review_candidates
--
DROP TABLE IF EXISTS reviews_review_candidates;
CREATE TABLE reviews_review_candidates (
    "id"                     uniqueidentifier,
    "sequence_id"            numeric,
    "instance_id"            uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "step_id"                ntext,
    "step_name"              ntext,
    "candidate_type"         ntext,
    "candidate_oxygen_id"    ntext
);

--
-- Table: reviews_review_comments
--
DROP TABLE IF EXISTS reviews_review_comments;
CREATE TABLE reviews_review_comments (
    "id"                     numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "review_document_id"     uniqueidentifier,
    "created_by"             ntext,
    "status"                 ntext,
    "text"                   ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "round_num"              numeric
);

--
-- Table: reviews_review_documents
--
DROP TABLE IF EXISTS reviews_review_documents;
CREATE TABLE reviews_review_documents (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "review_id"              uniqueidentifier,
    "versioned_urn"          ntext,
    "status"                 ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "round_num"              numeric
);

--
-- Table: reviews_review_steps
--
DROP TABLE IF EXISTS reviews_review_steps;
CREATE TABLE reviews_review_steps (
    "id"                     uniqueidentifier,
    "sequence_id"            numeric,
    "instance_id"            uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "workflow_id"            uniqueidentifier,
    "step_id"                ntext,
    "step_name"              ntext,
    "step_display_name"      ntext
);

--
-- Table: reviews_review_tasks
--
DROP TABLE IF EXISTS reviews_review_tasks;
CREATE TABLE reviews_review_tasks (
    "id"                     numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "review_id"              uniqueidentifier,
    "task_id"                uniqueidentifier,
    "task_key"               ntext,
    "name"                   ntext,
    "assignee"               ntext,
    "next_task_key"          ntext,
    "state"                  ntext,
    "due_date"               datetime,
    "created_at"             datetime,
    "updated_at"             datetime,
    "step_id"                ntext
);

--
-- Table: reviews_review_workflow_templates
--
DROP TABLE IF EXISTS reviews_review_workflow_templates;
CREATE TABLE reviews_review_workflow_templates (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "template_id"            uniqueidentifier,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: reviews_review_workflows
--
DROP TABLE IF EXISTS reviews_review_workflows;
CREATE TABLE reviews_review_workflows (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "workflow_template_id"   uniqueidentifier,
    "form_id"                uniqueidentifier,
    "name"                   ntext,
    "description"            ntext,
    "status"                 ntext,
    "bpmn_urn"               ntext,
    "memo"                   ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: reviews_reviews
--
DROP TABLE IF EXISTS reviews_reviews;
CREATE TABLE reviews_reviews (
    "id"                     uniqueidentifier,
    "sequence_id"            numeric,
    "instance_id"            uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "workflow_id"            uniqueidentifier,
    "status"                 ntext,
    "review_name"            ntext,
    "memo"                   ntext,
    "created_by"             ntext,
    "next_due_date"          datetime,
    "created_at"             datetime,
    "updated_at"             datetime,
    "docs_count"             numeric,
    "approved_count"         numeric,
    "rejected_count"         numeric,
    "workflow_name"          ntext,
    "started_at"             datetime,
    "finished_at"            datetime,
    "next_action_candidates_users" ntext,
    "next_action_candidates_roles" ntext,
    "next_action_candidates_companies" ntext,
    "next_action_claimed_by" ntext,
    "current_round_num"      numeric,
    "current_step"           numeric,
    "total_steps"            numeric,
    "is_archived"            bit
);

--
-- Table: reviews_workflow_notes
--
DROP TABLE IF EXISTS reviews_workflow_notes;
CREATE TABLE reviews_workflow_notes (
    "id"                     numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "review_id"              uniqueidentifier,
    "created_by"             ntext,
    "note"                   ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "round_num"              numeric
);

-- =================================================================
-- # Schema: rfis
-- =================================================================
--
-- Table: rfis_acc_attachments
--
DROP TABLE IF EXISTS rfis_acc_attachments;
CREATE TABLE rfis_acc_attachments (
    "id"                     uniqueidentifier,
    "rfi_id"                 uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "entity_id"              uniqueidentifier,
    "entity_type"            ntext,
    "display_name"           ntext,
    "created_at"             datetime,
    "created_by"             ntext,
    "deleted_at"             datetime,
    "deleted_by"             ntext
);

--
-- Table: rfis_attachments
--
DROP TABLE IF EXISTS rfis_attachments;
CREATE TABLE rfis_attachments (
    "rfi_id"                 uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "id"                     uniqueidentifier,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "deleted_by"             ntext,
    "name"                   ntext
);

--
-- Table: rfis_category
--
DROP TABLE IF EXISTS rfis_category;
CREATE TABLE rfis_category (
    "rfi_id"                 uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "category"               ntext
);

--
-- Table: rfis_comments
--
DROP TABLE IF EXISTS rfis_comments;
CREATE TABLE rfis_comments (
    "rfi_id"                 uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "id"                     uniqueidentifier,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "body"                   ntext
);

--
-- Table: rfis_discipline
--
DROP TABLE IF EXISTS rfis_discipline;
CREATE TABLE rfis_discipline (
    "rfi_id"                 uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "discipline"             ntext
);

--
-- Table: rfis_project_custom_attributes
--
DROP TABLE IF EXISTS rfis_project_custom_attributes;
CREATE TABLE rfis_project_custom_attributes (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "type"                   ntext,
    "description"            ntext,
    "multiple_choice"        bit,
    "status"                 ntext
);

--
-- Table: rfis_project_custom_attributes_enums
--
DROP TABLE IF EXISTS rfis_project_custom_attributes_enums;
CREATE TABLE rfis_project_custom_attributes_enums (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "custom_attribute_id"    uniqueidentifier,
    "name"                   ntext
);

--
-- Table: rfis_rfi_assignees
--
DROP TABLE IF EXISTS rfis_rfi_assignees;
CREATE TABLE rfis_rfi_assignees (
    "id"                     uniqueidentifier,
    "rfi_id"                 uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "oxygen_id"              ntext,
    "type"                   ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime
);

--
-- Table: rfis_rfi_co_reviewers
--
DROP TABLE IF EXISTS rfis_rfi_co_reviewers;
CREATE TABLE rfis_rfi_co_reviewers (
    "rfi_id"                 uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "user_id"                ntext
);

--
-- Table: rfis_rfi_custom_attributes
--
DROP TABLE IF EXISTS rfis_rfi_custom_attributes;
CREATE TABLE rfis_rfi_custom_attributes (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "rfi_id"                 uniqueidentifier,
    "custom_attribute_id"    uniqueidentifier,
    "value_enum_id"          uniqueidentifier,
    "value_float"            numeric,
    "value_str"              ntext
);

--
-- Table: rfis_rfi_distribution_list
--
DROP TABLE IF EXISTS rfis_rfi_distribution_list;
CREATE TABLE rfis_rfi_distribution_list (
    "rfi_id"                 uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "user_id"                ntext
);

--
-- Table: rfis_rfi_location
--
DROP TABLE IF EXISTS rfis_rfi_location;
CREATE TABLE rfis_rfi_location (
    "rfi_id"                 uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "location"               ntext
);

--
-- Table: rfis_rfi_responses
--
DROP TABLE IF EXISTS rfis_rfi_responses;
CREATE TABLE rfis_rfi_responses (
    "id"                     uniqueidentifier,
    "rfi_id"                 uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "content"                ntext,
    "updated_by"             ntext,
    "created_by"             ntext,
    "on_behalf"              ntext,
    "status"                 ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "state"                  ntext
);

--
-- Table: rfis_rfi_reviewers
--
DROP TABLE IF EXISTS rfis_rfi_reviewers;
CREATE TABLE rfis_rfi_reviewers (
    "rfi_id"                 uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "user_id"                ntext,
    "type"                   ntext
);

--
-- Table: rfis_rfi_transitions
--
DROP TABLE IF EXISTS rfis_rfi_transitions;
CREATE TABLE rfis_rfi_transitions (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "rfi_id"                 uniqueidentifier,
    "from_status"            ntext,
    "to_status"              ntext,
    "created_at"             datetime,
    "created_by"             ntext
);

--
-- Table: rfis_rfi_types
--
DROP TABLE IF EXISTS rfis_rfi_types;
CREATE TABLE rfis_rfi_types (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "wf_type"                ntext
);

--
-- Table: rfis_rfis
--
DROP TABLE IF EXISTS rfis_rfis;
CREATE TABLE rfis_rfis (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "custom_identifier"      ntext,
    "title"                  ntext,
    "question"               ntext,
    "status"                 ntext,
    "due_date"               datetime,
    "linked_document"        ntext,
    "linked_document_version" numeric,
    "linked_document_close_version" numeric,
    "official_response"      ntext,
    "official_response_status" ntext,
    "responded_at"           datetime,
    "responded_by"           ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "closed_by"              ntext,
    "closed_at"              datetime,
    "suggested_answer"       ntext,
    "manager_id"             ntext,
    "answered_at"            datetime,
    "answered_by"            ntext,
    "cost_impact"            ntext,
    "schedule_impact"        ntext,
    "priority"               ntext,
    "reference"              ntext,
    "opened_at"              datetime,
    "location_id"            ntext,
    "rfi_type"               uniqueidentifier,
    "bridged_source"         bit,
    "bridged_target"         bit
);

-- =================================================================
-- # Schema: schedule
-- =================================================================
--
-- Table: schedule_activities
--
DROP TABLE IF EXISTS schedule_activities;
CREATE TABLE schedule_activities (
    "id"                     uniqueidentifier,
    "schedule_id"            uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "unique_id"              numeric,
    "sequential_id"          numeric,
    "file_activity_id"       ntext,
    "parent_unique_id"       numeric,
    "type"                   ntext,
    "name"                   ntext,
    "is_critical_path"       bit,
    "completion_percentage"  numeric,
    "planned_start"          datetime,
    "planned_finish"         datetime,
    "actual_start"           datetime,
    "actual_finish"          datetime,
    "start"                  datetime,
    "finish"                 datetime,
    "duration"               numeric,
    "actual_duration"        numeric,
    "remaining_duration"     numeric,
    "free_slack_units"       ntext,
    "free_slack_duration"    numeric,
    "total_slack_units"      ntext,
    "total_slack_duration"   numeric,
    "is_wbs"                 bit,
    "wbs_path"               ntext,
    "wbs_code"               ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "wbs_path_text"          ntext
);

--
-- Table: schedule_activity_codes
--
DROP TABLE IF EXISTS schedule_activity_codes;
CREATE TABLE schedule_activity_codes (
    "id"                     uniqueidentifier,
    "schedule_id"            uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_unique_id"     numeric,
    "name"                   ntext,
    "value"                  ntext,
    "value_description"      ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: schedule_comments
--
DROP TABLE IF EXISTS schedule_comments;
CREATE TABLE schedule_comments (
    "id"                     uniqueidentifier,
    "schedule_id"            uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_unique_id"     numeric,
    "body"                   ntext,
    "created_by"             ntext,
    "created_at"             datetime
);

--
-- Table: schedule_dependencies
--
DROP TABLE IF EXISTS schedule_dependencies;
CREATE TABLE schedule_dependencies (
    "id"                     uniqueidentifier,
    "schedule_id"            uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "source_unique_id"       numeric,
    "target_unique_id"       numeric,
    "type"                   ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: schedule_plan_commitments
--
DROP TABLE IF EXISTS schedule_plan_commitments;
CREATE TABLE schedule_plan_commitments (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "plan_id"                uniqueidentifier,
    "task_id"                uniqueidentifier,
    "replanned_commitment_id" uniqueidentifier,
    "root_cause_id"          uniqueidentifier,
    "task_type"              ntext,
    "work_type"              ntext,
    "status"                 ntext,
    "start_date"             date,
    "finish_date"            date,
    "duration"               numeric,
    "assigned_member_id"     ntext,
    "assigned_company_id"    ntext,
    "assigned_role_id"       ntext,
    "location_id"            uniqueidentifier,
    "wbs_id"                 uniqueidentifier,
    "crew_size"              numeric,
    "was_start_changed"      bit,
    "was_duration_changed"   bit,
    "was_finish_changed"     bit,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime
);

--
-- Table: schedule_plan_handoffs
--
DROP TABLE IF EXISTS schedule_plan_handoffs;
CREATE TABLE schedule_plan_handoffs (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "plan_id"                uniqueidentifier,
    "source_task"            uniqueidentifier,
    "target_task"            uniqueidentifier,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime
);

--
-- Table: schedule_plan_plans
--
DROP TABLE IF EXISTS schedule_plan_plans;
CREATE TABLE schedule_plan_plans (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "schedule_id"            uniqueidentifier,
    "created_by"             ntext,
    "updated_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: schedule_plan_project_settings
--
DROP TABLE IF EXISTS schedule_plan_project_settings;
CREATE TABLE schedule_plan_project_settings (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "non_working_dates"      ntext,
    "first_day_of_the_week"  ntext,
    "working_days"           ntext,
    "wbs_tree"               ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime
);

--
-- Table: schedule_plan_task_comments
--
DROP TABLE IF EXISTS schedule_plan_task_comments;
CREATE TABLE schedule_plan_task_comments (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "task_id"                uniqueidentifier,
    "plan_id"                uniqueidentifier,
    "body"                   ntext,
    "created_at"             datetime,
    "created_by"             ntext
);

--
-- Table: schedule_plan_tasks
--
DROP TABLE IF EXISTS schedule_plan_tasks;
CREATE TABLE schedule_plan_tasks (
    "id"                     uniqueidentifier,
    "plan_id"                uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "parent_task_id"         uniqueidentifier,
    "activity_unique_id"     numeric,
    "unique_id"              numeric,
    "task_type"              ntext,
    "work_type"              ntext,
    "status"                 ntext,
    "title"                  ntext,
    "description"            ntext,
    "start_date"             date,
    "finish_date"            date,
    "duration"               numeric,
    "location_id"            uniqueidentifier,
    "assigned_member_id"     ntext,
    "assigned_company_id"    ntext,
    "assigned_role_id"       ntext,
    "wbs_id"                 uniqueidentifier,
    "completion_percentage"  numeric,
    "crew_size"              numeric,
    "priority"               numeric,
    "comments_count"         numeric,
    "commitments_count"      numeric,
    "task_imports_id"        ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime
);

--
-- Table: schedule_resources
--
DROP TABLE IF EXISTS schedule_resources;
CREATE TABLE schedule_resources (
    "id"                     uniqueidentifier,
    "schedule_id"            uniqueidentifier,
    "resource_unique_id"     numeric,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "activity_unique_id"     numeric,
    "name"                   ntext,
    "type"                   ntext,
    "email_address"          ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: schedule_schedules
--
DROP TABLE IF EXISTS schedule_schedules;
CREATE TABLE schedule_schedules (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "type"                   ntext,
    "version_number"         numeric,
    "is_public"              bit,
    "created_by"             ntext,
    "updated_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

-- =================================================================
-- # Schema: sheets
-- =================================================================
--
-- Table: sheets_disciplines
--
DROP TABLE IF EXISTS sheets_disciplines;
CREATE TABLE sheets_disciplines (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "container_type"         ntext,
    "index"                  numeric,
    "name"                   ntext,
    "designator"             ntext
);

--
-- Table: sheets_lineages
--
DROP TABLE IF EXISTS sheets_lineages;
CREATE TABLE sheets_lineages (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "container_type"         ntext,
    "name"                   ntext
);

--
-- Table: sheets_sets
--
DROP TABLE IF EXISTS sheets_sets;
CREATE TABLE sheets_sets (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "container_type"         ntext,
    "name"                   ntext,
    "issuance_date"          datetime,
    "created_at"             datetime,
    "created_by"             ntext,
    "created_by_name"        ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "updated_by_name"        ntext
);

--
-- Table: sheets_sheet_bubbles
--
DROP TABLE IF EXISTS sheets_sheet_bubbles;
CREATE TABLE sheets_sheet_bubbles (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "container_type"         ntext,
    "sheet_id"               uniqueidentifier,
    "urn"                    ntext,
    "viewable_guid"          ntext,
    "paper_width"            numeric,
    "paper_height"           numeric,
    "viewable_order"         numeric,
    "pug_urn"                ntext,
    "pug_width"              numeric,
    "pug_height"             numeric,
    "large_thumbnail_width"  numeric,
    "large_thumbnail_height" numeric,
    "small_thumbnail_width"  numeric,
    "small_thumbnail_height" numeric,
    "storage_urn"            ntext,
    "storage_size"           numeric,
    "viewable_urn"           ntext,
    "viewable_width"         numeric,
    "viewable_height"        numeric
);

--
-- Table: sheets_sheet_tags
--
DROP TABLE IF EXISTS sheets_sheet_tags;
CREATE TABLE sheets_sheet_tags (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "container_type"         ntext,
    "sheet_id"               uniqueidentifier,
    "value"                  ntext
);

--
-- Table: sheets_sheets
--
DROP TABLE IF EXISTS sheets_sheets;
CREATE TABLE sheets_sheets (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "container_type"         ntext,
    "name"                   ntext,
    "nat_sort_name"          ntext,
    "history_id"             uniqueidentifier,
    "version_set_id"         uniqueidentifier,
    "created_at"             datetime,
    "created_by"             ntext,
    "created_by_name"        ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "updated_by_name"        ntext,
    "title"                  ntext,
    "upload_file_name"       ntext,
    "upload_id"              uniqueidentifier,
    "processing_state"       ntext,
    "is_current"             bit,
    "discipline_index"       numeric,
    "deleted"                bit,
    "deleted_at"             datetime,
    "deleted_by"             ntext,
    "deleted_by_name"        ntext,
    "original_set_name"      ntext
);

-- =================================================================
-- # Schema: submittals
-- =================================================================
--
-- Table: submittals_attachments
--
DROP TABLE IF EXISTS submittals_attachments;
CREATE TABLE submittals_attachments (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "item_id"                uniqueidentifier,
    "name"                   ntext,
    "is_response"            bit,
    "revision"               numeric,
    "attachment_type_id"     ntext,
    "type_value"             ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "is_review"              bit,
    "is_deleted"             bit,
    "deleted_at"             datetime,
    "upload_urn"             ntext
);

--
-- Table: submittals_comments
--
DROP TABLE IF EXISTS submittals_comments;
CREATE TABLE submittals_comments (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "item_id"                uniqueidentifier,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "created_by"             ntext,
    "created_at"             datetime,
    "body"                   ntext,
    "is_deleted"             bit,
    "deleted_at"             datetime
);

--
-- Table: submittals_item_cc_users
--
DROP TABLE IF EXISTS submittals_item_cc_users;
CREATE TABLE submittals_item_cc_users (
    "item_id"                uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "user_id"                ntext
);

--
-- Table: submittals_item_co_reviewers_users
--
DROP TABLE IF EXISTS submittals_item_co_reviewers_users;
CREATE TABLE submittals_item_co_reviewers_users (
    "item_id"                uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "user_id"                ntext
);

--
-- Table: submittals_item_distribution_list_users
--
DROP TABLE IF EXISTS submittals_item_distribution_list_users;
CREATE TABLE submittals_item_distribution_list_users (
    "item_id"                uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "user_id"                ntext,
    "user_type_id"           ntext,
    "user_type_value"        ntext
);

--
-- Table: submittals_itemrevisions
--
DROP TABLE IF EXISTS submittals_itemrevisions;
CREATE TABLE submittals_itemrevisions (
    "revision"               numeric,
    "item_id"                uniqueidentifier,
    "item_title"             ntext,
    "item_identifier"        numeric,
    "spec_title"             ntext,
    "spec_identifier"        ntext,
    "spec_id"                uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier
);

--
-- Table: submittals_items
--
DROP TABLE IF EXISTS submittals_items;
CREATE TABLE submittals_items (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "spec_id"                uniqueidentifier,
    "spec_identifier"        ntext,
    "title"                  ntext,
    "type_id"                ntext,
    "type_value"             ntext,
    "response_comment"       ntext,
    "assigned_to"            ntext,
    "revision"               numeric,
    "responded_by"           ntext,
    "description"            ntext,
    "responded_at"           datetime,
    "due_date"               date,
    "required_on_job_date"   date,
    "manager"                ntext,
    "reviewer"               ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "state_id"               ntext,
    "response_id"            ntext,
    "response_value"         ntext,
    "subsection"             ntext,
    "subcontractor"          ntext,
    "identifier"             numeric,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "status_id"              ntext,
    "status_value"           ntext,
    "package_title"          ntext,
    "package"                uniqueidentifier,
    "package_identifier"     numeric,
    "priority_id"            numeric,
    "priority_value"         ntext,
    "required_date"          date,
    "required_approval_date" date,
    "lead_time"              numeric,
    "sent_to_submitter"      datetime,
    "received_from_submitter" datetime,
    "sent_to_reviewer"       datetime,
    "received_from_reviewer" datetime,
    "published_date"         datetime,
    "submitter_due_date"     date,
    "manager_due_date"       date,
    "reviewer_due_date"      date
);

--
-- Table: submittals_packages
--
DROP TABLE IF EXISTS submittals_packages;
CREATE TABLE submittals_packages (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "spec_id"                uniqueidentifier,
    "title"                  ntext,
    "identifier"             numeric,
    "updated_by"             ntext,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "deleted_at"             datetime,
    "is_deleted"             bit,
    "spec_identifier"        ntext
);

--
-- Table: submittals_specs
--
DROP TABLE IF EXISTS submittals_specs;
CREATE TABLE submittals_specs (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "updated_by"             ntext,
    "title"                  ntext,
    "identifier"             ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "is_deleted"             bit,
    "deleted_at"             datetime
);

-- =================================================================
-- # Schema: submittalsacc
-- =================================================================
--
-- Table: submittalsacc_attachments
--
DROP TABLE IF EXISTS submittalsacc_attachments;
CREATE TABLE submittalsacc_attachments (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "item_id"                uniqueidentifier,
    "name"                   ntext,
    "revision"               numeric,
    "created_by"             ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "upload_urn"             ntext,
    "category_id"            ntext,
    "category_value"         ntext,
    "task_id"                uniqueidentifier,
    "is_file_uploaded"       bit,
    "urn"                    ntext
);

--
-- Table: submittalsacc_comments
--
DROP TABLE IF EXISTS submittalsacc_comments;
CREATE TABLE submittalsacc_comments (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "item_id"                uniqueidentifier,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "created_by"             ntext,
    "created_at"             datetime,
    "body"                   ntext
);

--
-- Table: submittalsacc_custom_identifier_settings
--
DROP TABLE IF EXISTS submittalsacc_custom_identifier_settings;
CREATE TABLE submittalsacc_custom_identifier_settings (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "can_switch_type"        bit,
    "sequence_type"          ntext
);

--
-- Table: submittalsacc_item_custom_attribute_value
--
DROP TABLE IF EXISTS submittalsacc_item_custom_attribute_value;
CREATE TABLE submittalsacc_item_custom_attribute_value (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "item_id"                uniqueidentifier,
    "parameter_id"           uniqueidentifier,
    "parameter_name"         ntext,
    "parameter_type"         ntext,
    "value"                  ntext,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "deleted_at"             datetime,
    "select_value"           ntext
);

--
-- Table: submittalsacc_item_revision
--
DROP TABLE IF EXISTS submittalsacc_item_revision;
CREATE TABLE submittalsacc_item_revision (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "id"                     uniqueidentifier,
    "item_id"                uniqueidentifier,
    "manager"                ntext,
    "manager_type"           ntext,
    "subcontractor"          ntext,
    "subcontractor_type"     ntext,
    "revision"               numeric,
    "created_at"             datetime,
    "updated_at"             datetime,
    "sent_to_submitter"      datetime,
    "submitter_due_date"     date,
    "received_from_submitter" datetime,
    "submitted_by"           ntext,
    "sent_to_review"         datetime,
    "manager_due_date"       date,
    "sent_to_review_by"      ntext,
    "received_from_review"   datetime,
    "response_id"            ntext,
    "response_comment"       ntext,
    "responded_at"           datetime,
    "responded_by"           ntext,
    "published_date"         datetime,
    "published_by"           ntext
);

--
-- Table: submittalsacc_item_watchers
--
DROP TABLE IF EXISTS submittalsacc_item_watchers;
CREATE TABLE submittalsacc_item_watchers (
    "item_id"                uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "user_id"                ntext,
    "user_type_id"           ntext,
    "user_type_value"        ntext
);

--
-- Table: submittalsacc_items
--
DROP TABLE IF EXISTS submittalsacc_items;
CREATE TABLE submittalsacc_items (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "spec_id"                uniqueidentifier,
    "spec_identifier"        ntext,
    "title"                  ntext,
    "type_id"                ntext,
    "type_value"             ntext,
    "response_comment"       ntext,
    "ball_in_court"          ntext,
    "revision"               numeric,
    "responded_by"           ntext,
    "description"            ntext,
    "responded_at"           datetime,
    "due_date"               date,
    "required_on_job_date"   date,
    "manager"                ntext,
    "created_by"             ntext,
    "created_at"             datetime,
    "state_id"               ntext,
    "response_id"            ntext,
    "response_value"         ntext,
    "subsection"             ntext,
    "subcontractor"          ntext,
    "identifier"             numeric,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "status_id"              ntext,
    "status_value"           ntext,
    "package_title"          ntext,
    "package"                uniqueidentifier,
    "package_identifier"     numeric,
    "priority_id"            numeric,
    "priority_value"         ntext,
    "required_date"          date,
    "required_approval_date" date,
    "lead_time"              numeric,
    "sent_to_submitter"      datetime,
    "received_from_submitter" datetime,
    "submitted_by"           ntext,
    "sent_to_review"         datetime,
    "sent_to_review_by"      ntext,
    "received_from_review"   datetime,
    "published_date"         datetime,
    "published_by"           ntext,
    "submitter_due_date"     date,
    "manager_due_date"       date,
    "ball_in_court_users"    ntext,
    "ball_in_court_roles"    ntext,
    "ball_in_court_companies" ntext,
    "manager_type"           ntext,
    "subcontractor_type"     ntext,
    "custom_identifier"      ntext,
    "custom_identifier_sort" ntext,
    "custom_identifier_human_readable" ntext,
    "pending_actions_from"   ntext
);

--
-- Table: submittalsacc_itemtype
--
DROP TABLE IF EXISTS submittalsacc_itemtype;
CREATE TABLE submittalsacc_itemtype (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "created_at"             datetime,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "created_by"             ntext,
    "value"                  ntext,
    "platform_id"            ntext,
    "is_active"              bit
);

--
-- Table: submittalsacc_packages
--
DROP TABLE IF EXISTS submittalsacc_packages;
CREATE TABLE submittalsacc_packages (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "spec_id"                uniqueidentifier,
    "title"                  ntext,
    "identifier"             numeric,
    "description"            ntext,
    "updated_by"             ntext,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "spec_identifier"        ntext
);

--
-- Table: submittalsacc_parameters_collections
--
DROP TABLE IF EXISTS submittalsacc_parameters_collections;
CREATE TABLE submittalsacc_parameters_collections (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "parameter_id"           uniqueidentifier,
    "parameter_external_id"  ntext,
    "parameter_name"         ntext,
    "parameter_description"  ntext,
    "parameter_type"         ntext,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext,
    "deleted_at"             datetime,
    "parameter_select_options" ntext
);

--
-- Table: submittalsacc_specs
--
DROP TABLE IF EXISTS submittalsacc_specs;
CREATE TABLE submittalsacc_specs (
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "id"                     uniqueidentifier,
    "identifier"             ntext,
    "title"                  ntext,
    "created_at"             datetime,
    "created_by"             ntext,
    "updated_at"             datetime,
    "updated_by"             ntext
);

--
-- Table: submittalsacc_steps
--
DROP TABLE IF EXISTS submittalsacc_steps;
CREATE TABLE submittalsacc_steps (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "created_by"             ntext,
    "created_at"             datetime,
    "status"                 ntext,
    "step_number"            numeric,
    "days_to_respond"        numeric,
    "due_date"               date,
    "started_at"             datetime,
    "completed_at"           datetime,
    "item_id"                uniqueidentifier
);

--
-- Table: submittalsacc_tasks
--
DROP TABLE IF EXISTS submittalsacc_tasks;
CREATE TABLE submittalsacc_tasks (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "updated_by"             ntext,
    "updated_at"             datetime,
    "created_by"             ntext,
    "created_at"             datetime,
    "status"                 ntext,
    "assigned_to"            ntext,
    "is_required"            bit,
    "response_comment"       ntext,
    "responded_at"           datetime,
    "responded_by"           ntext,
    "started_at"             datetime,
    "completed_at"           datetime,
    "completed_by"           ntext,
    "response_value"         ntext,
    "response_id"            uniqueidentifier,
    "step_id"                uniqueidentifier,
    "assigned_to_type"       ntext
);

-- =================================================================
-- # Schema: takeoff
-- =================================================================
--
-- Table: takeoff_carbon_definitions
--
DROP TABLE IF EXISTS takeoff_carbon_definitions;
CREATE TABLE takeoff_carbon_definitions (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "declared_unit"          ntext,
    "unit_of_measure"        ntext,
    "a1_a2_a3_achievable"    numeric,
    "a1_a2_a3_conservative"  numeric,
    "a1_a2_a3_mean"          numeric,
    "a1_a2_a3_standard_deviation" numeric
);

--
-- Table: takeoff_classification_systems
--
DROP TABLE IF EXISTS takeoff_classification_systems;
CREATE TABLE takeoff_classification_systems (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "type"                   ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: takeoff_classifications
--
DROP TABLE IF EXISTS takeoff_classifications;
CREATE TABLE takeoff_classifications (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "system_id"              uniqueidentifier,
    "code"                   ntext,
    "parent_code"            ntext,
    "description"            ntext,
    "parent_id"              uniqueidentifier
);

--
-- Table: takeoff_content_lineages
--
DROP TABLE IF EXISTS takeoff_content_lineages;
CREATE TABLE takeoff_content_lineages (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "sheet_name"             ntext,
    "lineage_urn"            ntext,
    "view_name"              ntext,
    "type"                   ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: takeoff_packages
--
DROP TABLE IF EXISTS takeoff_packages;
CREATE TABLE takeoff_packages (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: takeoff_quantities
--
DROP TABLE IF EXISTS takeoff_quantities;
CREATE TABLE takeoff_quantities (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "quantity"               numeric,
    "output_name"            ntext,
    "unit_of_measure"        ntext,
    "quantity_order"         numeric,
    "item_id"                uniqueidentifier,
    "classification1_id"     uniqueidentifier,
    "classification2_id"     uniqueidentifier,
    "carbon_definition_id"   uniqueidentifier,
    "unit_cost"              numeric,
    "total_cost"             numeric
);

--
-- Table: takeoff_quantity_definitions
--
DROP TABLE IF EXISTS takeoff_quantity_definitions;
CREATE TABLE takeoff_quantity_definitions (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "output_name"            ntext,
    "expression"             ntext,
    "unit_of_measure"        ntext,
    "quantity_order"         numeric,
    "type_id"                uniqueidentifier,
    "classification1_id"     uniqueidentifier,
    "classification2_id"     uniqueidentifier,
    "unit_cost"              numeric,
    "carbon_definition_id"   uniqueidentifier
);

--
-- Table: takeoff_settings
--
DROP TABLE IF EXISTS takeoff_settings;
CREATE TABLE takeoff_settings (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "measurement_system"     ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: takeoff_takeoff_items
--
DROP TABLE IF EXISTS takeoff_takeoff_items;
CREATE TABLE takeoff_takeoff_items (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "content_lineage_id"     uniqueidentifier,
    "content_version"        ntext,
    "package_id"             uniqueidentifier,
    "type_id"                uniqueidentifier,
    "object_name"            ntext,
    "location_id"            uniqueidentifier,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: takeoff_takeoff_types
--
DROP TABLE IF EXISTS takeoff_takeoff_types;
CREATE TABLE takeoff_takeoff_types (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "name"                   ntext,
    "description"            ntext,
    "tool"                   ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "package_id"             uniqueidentifier
);

-- =================================================================
-- # Schema: transmittals
-- =================================================================
--
-- Table: transmittals_transmittal_documents
--
DROP TABLE IF EXISTS transmittals_transmittal_documents;
CREATE TABLE transmittals_transmittal_documents (
    "id"                     uniqueidentifier,
    "workflow_transmittal_id" uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "urn"                    ntext,
    "file_name"              ntext,
    "version_number"         numeric,
    "revision_number"        numeric,
    "parent_folder_urn"      ntext,
    "last_modified_time"     datetime,
    "last_modified_user_id"  ntext,
    "last_modified_user_name" ntext,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: transmittals_transmittal_non_members
--
DROP TABLE IF EXISTS transmittals_transmittal_non_members;
CREATE TABLE transmittals_transmittal_non_members (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "email"                  ntext,
    "first_name"             ntext,
    "last_name"              ntext,
    "company_name"           ntext,
    "role"                   ntext,
    "workflow_transmittal_id" uniqueidentifier,
    "viewed_at"              datetime,
    "downloaded_at"          datetime,
    "created_at"             datetime,
    "updated_at"             datetime
);

--
-- Table: transmittals_transmittal_recipients
--
DROP TABLE IF EXISTS transmittals_transmittal_recipients;
CREATE TABLE transmittals_transmittal_recipients (
    "id"                     uniqueidentifier,
    "workflow_transmittal_id" uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "user_id"                uniqueidentifier,
    "user_name"              ntext,
    "email"                  ntext,
    "created_at"             datetime,
    "updated_at"             datetime,
    "company_name"           ntext,
    "viewed_at"              datetime,
    "downloaded_at"          datetime
);

--
-- Table: transmittals_workflow_transmittals
--
DROP TABLE IF EXISTS transmittals_workflow_transmittals;
CREATE TABLE transmittals_workflow_transmittals (
    "id"                     uniqueidentifier,
    "bim360_account_id"      uniqueidentifier,
    "bim360_project_id"      uniqueidentifier,
    "sequence_id"            numeric,
    "title"                  ntext,
    "status"                 numeric,
    "create_user_id"         uniqueidentifier,
    "create_user_name"       ntext,
    "docs_count"             numeric,
    "created_at"             datetime,
    "updated_at"             datetime,
    "create_user_company_id" ntext,
    "create_user_company_name" ntext
);

