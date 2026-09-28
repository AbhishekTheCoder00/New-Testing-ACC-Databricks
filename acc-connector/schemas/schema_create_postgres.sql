-- ========================================================================================
-- # Copyright (c) 2026  Autodesk, Inc.
-- # Name        : schema_create_postgres.sql
-- # Description : SQL code to generate the ACC Data Schema in a POSTGRES relational database
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
-- Create the schema for data ingestion: acc_data_schema
CREATE SCHEMA IF NOT EXISTS acc_data_schema;

-- 
-- =================================================================
-- # Schema: activities
-- =================================================================
--
-- Table: activities_admin_activities
--
DROP TABLE IF EXISTS acc_data_schema.activities_admin_activities;
CREATE TABLE acc_data_schema.activities_admin_activities (
    "activity_id"            varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_verb"          varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "object_access_change_list" varchar,
    "object_added_services"  varchar,
    "object_allow_edit_company" varchar,
    "object_default_access_level" varchar,
    "object_display_name"    varchar,
    "object_id"              uuid,
    "object_name"            varchar,
    "object_name_was"        varchar,
    "object_object_type"     varchar,
    "object_removed_services" varchar,
    "object_service_name"    varchar,
    "object_services_list"   varchar,
    "object_size"            numeric,
    "object_status"          varchar,
    "object_status_was"      varchar,
    "object_update_image"    varchar,
    "target_display_name"    varchar,
    "target_id"              uuid,
    "target_object_type"     varchar
);

--
-- Table: activities_assets_activities
--
DROP TABLE IF EXISTS acc_data_schema.activities_assets_activities;
CREATE TABLE acc_data_schema.activities_assets_activities (
    "activity_id"            varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_verb"          varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "object_activity_source" varchar,
    "object_after_asset_status_color" varchar,
    "object_after_asset_status_display_name" varchar,
    "object_after_asset_status_entity_type" varchar,
    "object_after_asset_status_id" uuid,
    "object_after_asset_status_is_active" boolean,
    "object_after_asset_status_is_missing" boolean,
    "object_after_asset_status_is_valid" boolean,
    "object_after_category_display_name" varchar,
    "object_after_category_entity_type" varchar,
    "object_after_category_id" varchar,
    "object_after_category_is_active" boolean,
    "object_after_category_is_missing" boolean,
    "object_after_category_is_valid" boolean,
    "object_after_category_path" varchar,
    "object_after_location_display_name" varchar,
    "object_after_location_entity_type" varchar,
    "object_after_location_id" uuid,
    "object_after_location_is_active" boolean,
    "object_after_location_is_missing" boolean,
    "object_after_location_is_valid" boolean,
    "object_after_location_path" varchar,
    "object_before_entity_category_id" varchar,
    "object_before_entity_client_asset_id" varchar,
    "object_before_entity_created_at" timestamp without time zone,
    "object_before_entity_created_by" varchar,
    "object_before_entity_custom_attributes" varchar,
    "object_before_entity_id" uuid,
    "object_before_entity_is_active" boolean,
    "object_before_entity_location_id" uuid,
    "object_before_entity_status_id" uuid,
    "object_before_entity_updated_at" timestamp without time zone,
    "object_before_entity_updated_by" varchar,
    "object_before_entity_version" numeric,
    "object_before_location_display_name" varchar,
    "object_before_location_entity_type" varchar,
    "object_before_location_id" uuid,
    "object_before_location_is_active" boolean,
    "object_before_location_is_missing" boolean,
    "object_before_location_is_valid" boolean,
    "object_before_location_path" varchar,
    "object_category_display_name" varchar,
    "object_category_entity_type" varchar,
    "object_category_id"     varchar,
    "object_category_is_active" boolean,
    "object_category_is_missing" boolean,
    "object_category_is_valid" boolean,
    "object_category_path"   varchar,
    "object_created_entity_category_id" varchar,
    "object_created_entity_client_asset_id" varchar,
    "object_created_entity_created_at" timestamp without time zone,
    "object_created_entity_created_by" varchar,
    "object_created_entity_id" uuid,
    "object_created_entity_is_active" boolean,
    "object_created_entity_status_id" uuid,
    "object_created_entity_updated_at" timestamp without time zone,
    "object_created_entity_updated_by" varchar,
    "object_created_entity_version" numeric,
    "object_deleted_entity_category_id" varchar,
    "object_deleted_entity_client_asset_id" varchar,
    "object_deleted_entity_created_at" timestamp without time zone,
    "object_deleted_entity_created_by" varchar,
    "object_deleted_entity_deleted_at" timestamp without time zone,
    "object_deleted_entity_deleted_by" varchar,
    "object_deleted_entity_id" uuid,
    "object_deleted_entity_is_active" boolean,
    "object_deleted_entity_location_id" uuid,
    "object_deleted_entity_status_id" uuid,
    "object_deleted_entity_updated_at" timestamp without time zone,
    "object_deleted_entity_updated_by" varchar,
    "object_deleted_entity_version" numeric,
    "object_display_name"    varchar,
    "object_id"              uuid,
    "object_location_display_name" varchar,
    "object_location_entity_type" varchar,
    "object_location_id"     uuid,
    "object_location_is_active" boolean,
    "object_location_is_missing" boolean,
    "object_location_is_valid" boolean,
    "object_location_path"   varchar,
    "object_patch_entity_custom_attributes" varchar,
    "object_patch_entity_updated_at" timestamp without time zone,
    "object_patch_entity_updated_by" varchar,
    "object_asset_status_color" varchar,
    "object_asset_status_display_name" varchar,
    "object_asset_status_entity_type" varchar,
    "object_asset_status_id" uuid,
    "object_asset_status_is_active" boolean,
    "object_asset_status_is_missing" boolean,
    "object_asset_status_is_valid" boolean,
    "object_before_asset_status_color" varchar,
    "object_before_asset_status_display_name" varchar,
    "object_before_asset_status_entity_type" varchar,
    "object_before_asset_status_id" uuid,
    "object_before_asset_status_is_active" boolean,
    "object_before_asset_status_is_missing" boolean,
    "object_before_asset_status_is_valid" boolean,
    "object_before_category_display_name" varchar,
    "object_before_category_entity_type" varchar,
    "object_before_category_id" varchar,
    "object_before_category_is_active" boolean,
    "object_before_category_is_missing" boolean,
    "object_before_category_is_valid" boolean,
    "object_before_category_path" varchar
);

--
-- Table: activities_bridge_activities
--
DROP TABLE IF EXISTS acc_data_schema.activities_bridge_activities;
CREATE TABLE acc_data_schema.activities_bridge_activities (
    "activity_id"            varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_verb"          varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "object_automation_type" varchar,
    "object_initiator_project_id" varchar,
    "object_item_name"       varchar,
    "object_origin"          varchar,
    "object_owner"           varchar,
    "object_reason"          varchar,
    "object_recipient_email" varchar,
    "object_source_project_account_id" varchar,
    "object_source_project_display_name" varchar,
    "object_source_project_id" varchar,
    "object_target_project_account_id" varchar,
    "object_target_project_display_name" varchar,
    "object_target_project_id" varchar
);

--
-- Table: activities_cost_activities
--
DROP TABLE IF EXISTS acc_data_schema.activities_cost_activities;
CREATE TABLE acc_data_schema.activities_cost_activities (
    "activity_id"            varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_verb"          varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "object_cost_payment_display_name" varchar,
    "object_cost_payment_id" uuid,
    "object_uom_display_name" varchar,
    "object_uom_id"          varchar,
    "object_uom_type"        varchar,
    "object_abbr"            varchar,
    "object_association_association_type" varchar,
    "object_association_display_name" varchar,
    "object_association_id"  uuid,
    "object_association_number" varchar,
    "object_association_type" varchar,
    "object_attachment_display_name" varchar,
    "object_attachment_id"   uuid,
    "object_attachment_type" varchar,
    "object_billing_period_display_name" uuid,
    "object_billing_period_end_date" date,
    "object_billing_period_id" uuid,
    "object_billing_period_start_date" date,
    "object_budget_code"     varchar,
    "object_budget_display_name" varchar,
    "object_budget_id"       uuid,
    "object_budget_payment_display_name" varchar,
    "object_budget_payment_id" uuid,
    "object_budget_payment_type" varchar,
    "object_budgetpayment_display_name" varchar,
    "object_budgetpayment_id" uuid,
    "object_budgets"         varchar,
    "object_calendar_configuration_display_name" varchar,
    "object_calendar_configuration_id" varchar,
    "object_code"            numeric,
    "object_comment_display_name" varchar,
    "object_comment_id"      uuid,
    "object_compliance_definition_display_name" varchar,
    "object_compliance_definition_id" varchar,
    "object_compliance_definition_type" varchar,
    "object_compliance_requirement_display_name" varchar,
    "object_compliance_requirement_id" varchar,
    "object_compliance_requirement_type" varchar,
    "object_container_setting_display_name" varchar,
    "object_container_setting_id" uuid,
    "object_contract_display_name" varchar,
    "object_contract_id"     uuid,
    "object_cost_item_display_name" varchar,
    "object_cost_item_id"    uuid,
    "object_custom_column_display_name" uuid,
    "object_custom_column_id" uuid,
    "object_default_value_display_name" varchar,
    "object_default_value_id" varchar,
    "object_display_name"    varchar,
    "object_distribution_display_name" uuid,
    "object_distribution_id" uuid,
    "object_distribution_item_display_name" varchar,
    "object_distribution_item_id" varchar,
    "object_document_package_display_name" varchar,
    "object_document_package_id" uuid,
    "object_document_template_display_name" varchar,
    "object_document_template_id" uuid,
    "object_document_template_type" varchar,
    "object_document_package_item_display_name" uuid,
    "object_document_package_item_id" uuid,
    "object_email_notification_display_name" uuid,
    "object_email_notification_id" uuid,
    "object_exchange_rate_display_name" varchar,
    "object_exchange_rate_id" varchar,
    "object_expense_code"    varchar,
    "object_expense_display_name" varchar,
    "object_expense_id"      uuid,
    "object_expense_type"    varchar,
    "object_expense_item_code" numeric,
    "object_expense_item_display_name" varchar,
    "object_expense_item_id" uuid,
    "object_forecast_adjustment_display_name" varchar,
    "object_forecast_adjustment_id" uuid,
    "object_form_definition_display_name" varchar,
    "object_form_definition_id" uuid,
    "object_form_instance_code" numeric,
    "object_form_instance_display_name" varchar,
    "object_form_instance_id" uuid,
    "object_form_instance_type" varchar,
    "object_form_item_display_name" uuid,
    "object_form_item_id"    uuid,
    "object_from_display_name" varchar,
    "object_from_id"         uuid,
    "object_group_key"       varchar,
    "object_id"              uuid,
    "object_key"             varchar,
    "object_main_contract_code" numeric,
    "object_main_contract_display_name" varchar,
    "object_main_contract_id" uuid,
    "object_main_contract_is_mile_stone" varchar,
    "object_main_contract_type" varchar,
    "object_main_contract_item_code" numeric,
    "object_main_contract_item_display_name" varchar,
    "object_main_contract_item_id" uuid,
    "object_maincontract_display_name" varchar,
    "object_maincontract_id" uuid,
    "object_markup_formula_display_name" varchar,
    "object_markup_formula_id" uuid,
    "object_milestone_display_name" varchar,
    "object_milestone_id"    uuid,
    "object_milestone_type"  varchar,
    "object_oco_display_name" varchar,
    "object_oco_id"          uuid,
    "object_parent_display_name" varchar,
    "object_parent_id"       uuid,
    "object_payment_display_name" varchar,
    "object_payment_id"      uuid,
    "object_payment_item_code" numeric,
    "object_payment_item_display_name" varchar,
    "object_payment_item_id" uuid,
    "object_payment_reference_display_name" varchar,
    "object_payment_reference_id" varchar,
    "object_payment_reference_is_mile_stone" varchar,
    "object_payment_reference_paid_amount" varchar,
    "object_payment_reference_reference" varchar,
    "object_pco_display_name" varchar,
    "object_pco_id"          uuid,
    "object_permission_display_name" uuid,
    "object_permission_id"   uuid,
    "object_permission_level" varchar,
    "object_preset"          varchar,
    "object_proceed_step_display_name" varchar,
    "object_proceed_step_id" varchar,
    "object_proceed_step_index" numeric,
    "object_proceed_step_task_definition_key" varchar,
    "object_property_definition_display_name" varchar,
    "object_property_definition_id" uuid,
    "object_property_definition_type" varchar,
    "object_property_value_display_name" uuid,
    "object_property_value_id" uuid,
    "object_rco_code"        varchar,
    "object_rco_display_name" varchar,
    "object_rco_id"          uuid,
    "object_rco_is_mile_stone" varchar,
    "object_recipient"       varchar,
    "object_resource_type"   varchar,
    "object_rfq_display_name" varchar,
    "object_rfq_id"          uuid,
    "object_schedule_of_value_code" numeric,
    "object_schedule_of_value_display_name" varchar,
    "object_schedule_of_value_id" uuid,
    "object_sco_display_name" varchar,
    "object_sco_id"          uuid,
    "object_segment_display_name" varchar,
    "object_segment_id"      uuid,
    "object_segment_value_code" numeric,
    "object_segment_value_display_name" numeric,
    "object_segment_value_id" uuid,
    "object_source"          varchar,
    "object_source_type"     varchar,
    "object_sub_cost_item_code" numeric,
    "object_sub_cost_item_display_name" varchar,
    "object_sub_cost_item_id" uuid,
    "object_sub_cost_item_type" varchar,
    "object_subject_id"      numeric,
    "object_subject_type"    varchar,
    "object_tax_display_name" uuid,
    "object_tax_id"          uuid,
    "object_tax_association_association_type" varchar,
    "object_tax_association_display_name" varchar,
    "object_tax_association_id" varchar,
    "object_tax_association_number" varchar,
    "object_tax_formula_display_name" varchar,
    "object_tax_formula_id"  uuid,
    "object_tax_formula_item_display_name" varchar,
    "object_tax_formula_item_id" varchar,
    "object_tax_formula_item_type" varchar,
    "object_tax_item_display_name" varchar,
    "object_tax_item_id"     varchar,
    "object_template_display_name" varchar,
    "object_template_id"     uuid,
    "object_terminated_step_display_name" varchar,
    "object_terminated_step_id" varchar,
    "object_terminated_step_index" numeric,
    "object_terminated_step_task_definition_key" varchar,
    "object_terminology_display_name" uuid,
    "object_terminology_id"  uuid,
    "object_terminology_type" varchar,
    "object_to"              varchar,
    "object_tracking_item_instance_code" varchar,
    "object_tracking_item_instance_display_name" varchar,
    "object_tracking_item_instance_id" varchar,
    "object_transference_display_name" uuid,
    "object_transference_id" uuid,
    "object_type"            varchar,
    "object_undefined_display_name" varchar,
    "object_undefined_id"    varchar,
    "object_verb_key"        varchar,
    "object_workflow_condition_display_name" uuid,
    "object_workflow_condition_id" uuid,
    "object_workflow_definition_display_name" varchar,
    "object_workflow_definition_id" uuid,
    "object_workflow_instance_display_name" varchar,
    "object_workflow_instance_id" uuid
);

--
-- Table: activities_cost_changes
--
DROP TABLE IF EXISTS acc_data_schema.activities_cost_changes;
CREATE TABLE acc_data_schema.activities_cost_changes (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_id"            varchar,
    "created_at"             timestamp without time zone,
    "activity_verb"          varchar,
    "change_type"            varchar,
    "before_value"           varchar,
    "after_value"            varchar
);

--
-- Table: activities_docs_activities
--
DROP TABLE IF EXISTS acc_data_schema.activities_docs_activities;
CREATE TABLE acc_data_schema.activities_docs_activities (
    "activity_id"            varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_verb"          varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "object_approval_status" varchar,
    "object_collection_display_name" varchar,
    "object_collection_id"   uuid,
    "object_collection_instance_index" numeric,
    "object_collection_size" numeric,
    "object_display_name"    varchar,
    "object_file_name"       varchar,
    "object_folder_display_name" varchar,
    "object_folder_id"       varchar,
    "object_from_set_display_name" varchar,
    "object_from_set_id"     varchar,
    "object_hyperlink_display_name" varchar,
    "object_hyperlink_hyperlink_id" varchar,
    "object_hyperlink_id"    varchar,
    "object_hyperlink_object_type" varchar,
    "object_hyperlink_parent_folder_urn" varchar,
    "object_id"              varchar,
    "object_issuance_date"   date,
    "object_new_description" varchar,
    "object_new_issuance_date" date,
    "object_object_type"     varchar,
    "object_observer_id"     varchar,
    "object_observer_name"   varchar,
    "object_observer_type"   varchar,
    "object_old_description" varchar,
    "object_old_issuance_date" date,
    "object_old_name"        varchar,
    "object_parent_folder_urn" varchar,
    "object_pending_name"    varchar,
    "object_remove_reason"   varchar,
    "object_resource_type"   varchar,
    "object_review_display_name" varchar,
    "object_review_id"       uuid,
    "object_review_sequence_id" numeric,
    "object_reviewer_id"     varchar,
    "object_reviewer_name"   varchar,
    "object_reviewer_type"   varchar,
    "object_revision_number" varchar,
    "object_sequence_id"     numeric,
    "object_source_display_name" varchar,
    "object_source_id"       varchar,
    "object_source_object_type" varchar,
    "object_source_parent_folder_urn" varchar,
    "object_source_version"  numeric,
    "object_status"          varchar,
    "object_task_name"       varchar,
    "object_version"         numeric,
    "object_version_set_display_name" varchar,
    "object_version_set_id"  uuid,
    "object_version_set_issuance_date" date,
    "object_version_urn"     varchar,
    "object_version_number"  numeric,
    "target_display_name"    varchar,
    "target_folder_display_name" varchar,
    "target_folder_id"       varchar,
    "target_id"              varchar,
    "target_object_type"     varchar,
    "target_parent_folder_urn" varchar,
    "target_project_account_id" uuid,
    "target_project_id"      uuid,
    "target_sequence_id"     numeric,
    "target_version"         numeric,
    "target_viewer_display_name" varchar,
    "target_viewer_id"       varchar
);

--
-- Table: activities_docs_custom_attribute_constraints
--
DROP TABLE IF EXISTS acc_data_schema.activities_docs_custom_attribute_constraints;
CREATE TABLE acc_data_schema.activities_docs_custom_attribute_constraints (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_id"            varchar,
    "created_at"             timestamp without time zone,
    "activity_verb"          varchar,
    "id"                     numeric,
    "attribute_id"           numeric,
    "type"                   varchar,
    "length_type"            varchar,
    "max_length"             numeric,
    "min_length"             numeric,
    "default_value"          varchar
);

--
-- Table: activities_docs_custom_attributes
--
DROP TABLE IF EXISTS acc_data_schema.activities_docs_custom_attributes;
CREATE TABLE acc_data_schema.activities_docs_custom_attributes (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_id"            varchar,
    "created_at"             timestamp without time zone,
    "activity_verb"          varchar,
    "id"                     numeric,
    "name"                   varchar,
    "value"                  varchar,
    "old_value"              varchar,
    "created_by"             varchar,
    "updated_by"             varchar,
    "attribute_type"         varchar
);

--
-- Table: activities_docs_naming_standards
--
DROP TABLE IF EXISTS acc_data_schema.activities_docs_naming_standards;
CREATE TABLE acc_data_schema.activities_docs_naming_standards (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_id"            varchar,
    "created_at"             timestamp without time zone,
    "activity_verb"          varchar,
    "module"                 varchar,
    "name"                   varchar,
    "old_name"               varchar,
    "new_name"               varchar,
    "upload_rule"            varchar,
    "attribute_name"         varchar
);

--
-- Table: activities_docs_permissions
--
DROP TABLE IF EXISTS acc_data_schema.activities_docs_permissions;
CREATE TABLE acc_data_schema.activities_docs_permissions (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_id"            varchar,
    "created_at"             timestamp without time zone,
    "activity_verb"          varchar,
    "permission"             varchar
);

--
-- Table: activities_docs_standard_attributes
--
DROP TABLE IF EXISTS acc_data_schema.activities_docs_standard_attributes;
CREATE TABLE acc_data_schema.activities_docs_standard_attributes (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_id"            varchar,
    "created_at"             timestamp without time zone,
    "activity_verb"          varchar,
    "id"                     numeric,
    "name"                   varchar,
    "attribute_type"         varchar,
    "value"                  varchar
);

--
-- Table: activities_issues_activities
--
DROP TABLE IF EXISTS acc_data_schema.activities_issues_activities;
CREATE TABLE acc_data_schema.activities_issues_activities (
    "activity_id"            varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_verb"          varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "object_answer"          varchar,
    "object_assigned_to"     varchar,
    "object_assigned_to_type" varchar,
    "object_attachment_attachment_type" varchar,
    "object_attachment_display_name" varchar,
    "object_attachment_id"   uuid,
    "object_attachment_name" varchar,
    "object_attachment_urn"  varchar,
    "object_attachment_urn_type" varchar,
    "object_comment_id"      uuid,
    "object_created_at"      timestamp without time zone,
    "object_display_name"    numeric,
    "object_id"              uuid,
    "object_status"          varchar,
    "object_title"           varchar,
    "object_updated_at"      timestamp without time zone
);

--
-- Table: activities_issues_changes
--
DROP TABLE IF EXISTS acc_data_schema.activities_issues_changes;
CREATE TABLE acc_data_schema.activities_issues_changes (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_id"            varchar,
    "created_at"             timestamp without time zone,
    "activity_verb"          varchar,
    "change_type"            varchar,
    "before_value"           varchar,
    "after_value"            varchar
);

--
-- Table: activities_rfis_activities
--
DROP TABLE IF EXISTS acc_data_schema.activities_rfis_activities;
CREATE TABLE acc_data_schema.activities_rfis_activities (
    "activity_id"            varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_verb"          varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "object_comment_body"    varchar,
    "object_comment_id"      uuid,
    "object_comment_mentions" varchar,
    "object_comment_rfi_id"  uuid,
    "object_comment_source"  varchar,
    "object_display_name"    varchar,
    "object_id"              uuid
);

--
-- Table: activities_rfis_changes
--
DROP TABLE IF EXISTS acc_data_schema.activities_rfis_changes;
CREATE TABLE acc_data_schema.activities_rfis_changes (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_id"            varchar,
    "created_at"             timestamp without time zone,
    "activity_verb"          varchar,
    "change_type"            varchar,
    "before_value"           varchar,
    "after_value"            varchar
);

--
-- Table: activities_sheets_activities
--
DROP TABLE IF EXISTS acc_data_schema.activities_sheets_activities;
CREATE TABLE acc_data_schema.activities_sheets_activities (
    "activity_id"            varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_verb"          varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "object_acc_collection_display_name" varchar,
    "object_acc_collection_id" varchar,
    "object_collection_display_name" varchar,
    "object_collection_id"   uuid,
    "object_collection_instance_index" numeric,
    "object_collection_size" numeric,
    "object_display_name"    varchar,
    "object_history_display_name" varchar,
    "object_history_id"      uuid,
    "object_id"              uuid,
    "object_indirect"        boolean,
    "object_issuance_date"   timestamp without time zone,
    "object_object_type"     varchar,
    "object_source_file"     varchar,
    "object_source_object_display_name" varchar,
    "object_source_object_history" varchar,
    "object_source_object_id" uuid,
    "object_source_object_object_type" varchar,
    "object_source_object_project" varchar,
    "object_source_object_version_set" varchar,
    "object_target_object_display_name" varchar,
    "object_target_object_history" varchar,
    "object_target_object_id" uuid,
    "object_target_object_object_type" varchar,
    "object_target_object_project" varchar,
    "object_target_object_version_set" varchar,
    "object_title"           varchar,
    "object_version_set_display_name" varchar,
    "object_version_set_id"  uuid,
    "object_version_set_issuance_date" timestamp without time zone,
    "target_acc_collection_display_name" varchar,
    "target_acc_collection_id" varchar,
    "target_display_name"    varchar,
    "target_history_display_name" varchar,
    "target_history_id"      varchar,
    "target_id"              uuid,
    "target_issuance_date"   timestamp without time zone,
    "target_object_type"     varchar
);

--
-- Table: activities_submittals_activities
--
DROP TABLE IF EXISTS acc_data_schema.activities_submittals_activities;
CREATE TABLE acc_data_schema.activities_submittals_activities (
    "activity_id"            varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_verb"          varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "object_assigned_to"     varchar,
    "object_assigned_to_field" varchar,
    "object_attachment_category" varchar,
    "object_attribute_object_type" varchar,
    "object_attribute_type"  varchar,
    "object_ball_in_court_type" varchar,
    "object_body"            varchar,
    "object_container_custom_identifier_sequence_type" varchar,
    "object_container_display_name" varchar,
    "object_container_id"    uuid,
    "object_container_object_type" varchar,
    "object_created_by"      varchar,
    "object_created_on"      timestamp without time zone,
    "object_custom_identifier" varchar,
    "object_custom_identifier_sort" varchar,
    "object_description"     varchar,
    "object_display_name"    varchar,
    "object_entities_0_created_on" timestamp without time zone,
    "object_entities_0_display_name" varchar,
    "object_entities_0_domain" varchar,
    "object_entities_0_id"   varchar,
    "object_entities_0_type" varchar,
    "object_entities_1_created_on" timestamp without time zone,
    "object_entities_1_display_name" varchar,
    "object_entities_1_domain" varchar,
    "object_entities_1_id"   varchar,
    "object_entities_1_type" varchar,
    "object_entities_display_name" varchar,
    "object_entities_id"     varchar,
    "object_entity_created_on" timestamp without time zone,
    "object_entity_display_name" varchar,
    "object_entity_domain"   varchar,
    "object_entity_id"       varchar,
    "object_entity_type"     varchar,
    "object_id"              uuid,
    "object_identifier"      numeric,
    "object_item_assigned_to_field" varchar,
    "object_item_ball_in_court_type" varchar,
    "object_item_custom_identifier" varchar,
    "object_item_custom_identifier_sort" varchar,
    "object_item_description" varchar,
    "object_item_display_name" varchar,
    "object_item_id"         uuid,
    "object_item_identifier" numeric,
    "object_item_lead_time"  numeric,
    "object_item_object_type" varchar,
    "object_item_priority"   varchar,
    "object_item_required_approval_date" date,
    "object_item_required_date" date,
    "object_item_required_on_job_date" date,
    "object_item_response_comment" varchar,
    "object_item_response_id" uuid,
    "object_item_revision"   numeric,
    "object_item_sequence_type_change" varchar,
    "object_item_state_id"   varchar,
    "object_item_status_id"  varchar,
    "object_item_submitter_due_date" date,
    "object_item_subsection" varchar,
    "object_item_title"      varchar,
    "object_item_type_id"    uuid,
    "object_lead_time"       numeric,
    "object_name_for_activity" varchar,
    "object_new_value"       varchar,
    "object_object_type"     varchar,
    "object_old_value"       varchar,
    "object_package"         varchar,
    "object_priority"        varchar,
    "object_required_approval_date" date,
    "object_required_date"   date,
    "object_required_on_job_date" date,
    "object_resource_urns"   varchar,
    "object_response_comment" varchar,
    "object_response_id"     uuid,
    "object_revision"        numeric,
    "object_sequence_type_change" varchar,
    "object_spec_container_custom_identifier_sequence_type" varchar,
    "object_spec_container_display_name" varchar,
    "object_spec_container_id" varchar,
    "object_spec_container_object_type" varchar,
    "object_spec_display_name" varchar,
    "object_spec_id"         uuid,
    "object_spec_identifier" varchar,
    "object_spec_object_type" varchar,
    "object_state_from_display_name" varchar,
    "object_state_from_id"   varchar,
    "object_state_from_object_type" varchar,
    "object_state_id"        varchar,
    "object_state_to_display_name" varchar,
    "object_state_to_id"     varchar,
    "object_state_to_object_type" varchar,
    "object_status_id"       varchar,
    "object_step_id"         uuid,
    "object_step_number"     numeric,
    "object_steps"           varchar,
    "object_submitter_due_date" date,
    "object_subsection"      varchar,
    "object_task_id"         uuid,
    "object_tasks"           varchar,
    "object_title"           varchar,
    "object_type_container_custom_identifier_sequence_type" varchar,
    "object_type_container_display_name" varchar,
    "object_type_container_id" varchar,
    "object_type_container_object_type" varchar,
    "object_type_display_name" varchar,
    "object_type_id"         uuid,
    "object_type_is_active"  boolean,
    "object_type_key"        varchar,
    "object_type_object_type" varchar,
    "object_type_platform_id" varchar,
    "object_type_value"      varchar,
    "object_type_identifier" uuid,
    "object_urn"             varchar,
    "object_urn_type"        varchar,
    "object_watchers"        varchar,
    "target_assigned_to_display_name" varchar,
    "target_assigned_to_human_readable_company" varchar,
    "target_assigned_to_human_readable_name" varchar,
    "target_assigned_to_id"  varchar,
    "target_assigned_to_object_type" varchar,
    "target_assigned_to_autodesk_id" varchar,
    "target_assigned_to_roles" varchar,
    "target_assigned_to_field" varchar,
    "target_ball_in_court_type" varchar,
    "target_container_custom_identifier_sequence_type" varchar,
    "target_container_display_name" varchar,
    "target_container_id"    uuid,
    "target_container_object_type" varchar,
    "target_custom_identifier" varchar,
    "target_custom_identifier_sort" varchar,
    "target_description"     varchar,
    "target_display_name"    varchar,
    "target_id"              varchar,
    "target_identifier"      numeric,
    "target_lead_time"       numeric,
    "target_object_type"     varchar,
    "target_package_container_custom_identifier_sequence_type" varchar,
    "target_package_container_display_name" varchar,
    "target_package_container_id" uuid,
    "target_package_container_object_type" varchar,
    "target_package_display_name" varchar,
    "target_package_id"      uuid,
    "target_package_identifier" numeric,
    "target_package_is_deleted" boolean,
    "target_package_object_type" varchar,
    "target_package_spec_display_name" varchar,
    "target_package_spec_id" uuid,
    "target_package_spec_identifier" varchar,
    "target_package_spec_object_type" varchar,
    "target_priority"        varchar,
    "target_required_approval_date" date,
    "target_required_date"   date,
    "target_required_on_job_date" date,
    "target_response_comment" varchar,
    "target_response_id"     varchar,
    "target_revision"        numeric,
    "target_sequence_type_change" varchar,
    "target_spec_container_custom_identifier_sequence_type" varchar,
    "target_spec_container_display_name" varchar,
    "target_spec_container_id" uuid,
    "target_spec_container_object_type" varchar,
    "target_spec_display_name" varchar,
    "target_spec_id"         varchar,
    "target_spec_identifier" varchar,
    "target_spec_object_type" varchar,
    "target_state_id"        varchar,
    "target_status_id"       varchar,
    "target_submitter_due_date" date,
    "target_subsection"      varchar,
    "target_title"           varchar,
    "target_type_container_custom_identifier_sequence_type" varchar,
    "target_type_container_display_name" varchar,
    "target_type_container_id" uuid,
    "target_type_container_object_type" varchar,
    "target_type_display_name" varchar,
    "target_type_id"         uuid,
    "target_type_is_active"  boolean,
    "target_type_key"        varchar,
    "target_type_object_type" varchar,
    "target_type_platform_id" varchar,
    "target_type_value"      varchar,
    "target_type_identifier" uuid
);

--
-- Table: activities_submittals_object_ball_in_court_companies
--
DROP TABLE IF EXISTS acc_data_schema.activities_submittals_object_ball_in_court_companies;
CREATE TABLE acc_data_schema.activities_submittals_object_ball_in_court_companies (
    "activity_id"            varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_verb"          varchar,
    "created_at"             timestamp without time zone,
    "display_name"           varchar,
    "human_readable_name"    varchar,
    "id"                     varchar,
    "object_type"            varchar,
    "autodesk_id"            varchar
);

--
-- Table: activities_submittals_object_ball_in_court_roles
--
DROP TABLE IF EXISTS acc_data_schema.activities_submittals_object_ball_in_court_roles;
CREATE TABLE acc_data_schema.activities_submittals_object_ball_in_court_roles (
    "activity_id"            varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_verb"          varchar,
    "created_at"             timestamp without time zone,
    "display_name"           varchar,
    "human_readable_name"    varchar,
    "id"                     varchar,
    "object_type"            varchar,
    "autodesk_id"            varchar
);

--
-- Table: activities_submittals_object_ball_in_court_users
--
DROP TABLE IF EXISTS acc_data_schema.activities_submittals_object_ball_in_court_users;
CREATE TABLE acc_data_schema.activities_submittals_object_ball_in_court_users (
    "activity_id"            varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_verb"          varchar,
    "created_at"             timestamp without time zone,
    "display_name"           varchar,
    "human_readable_company" varchar,
    "human_readable_name"    varchar,
    "id"                     varchar,
    "object_type"            varchar,
    "autodesk_id"            varchar,
    "roles"                  varchar
);

--
-- Table: activities_submittals_target_ball_in_court_companies
--
DROP TABLE IF EXISTS acc_data_schema.activities_submittals_target_ball_in_court_companies;
CREATE TABLE acc_data_schema.activities_submittals_target_ball_in_court_companies (
    "activity_id"            varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_verb"          varchar,
    "created_at"             timestamp without time zone,
    "display_name"           varchar,
    "human_readable_name"    varchar,
    "id"                     varchar,
    "object_type"            varchar,
    "autodesk_id"            varchar
);

--
-- Table: activities_submittals_target_ball_in_court_roles
--
DROP TABLE IF EXISTS acc_data_schema.activities_submittals_target_ball_in_court_roles;
CREATE TABLE acc_data_schema.activities_submittals_target_ball_in_court_roles (
    "activity_id"            varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_verb"          varchar,
    "created_at"             timestamp without time zone,
    "display_name"           varchar,
    "human_readable_name"    varchar,
    "id"                     varchar,
    "object_type"            varchar,
    "autodesk_id"            varchar
);

--
-- Table: activities_submittals_target_ball_in_court_users
--
DROP TABLE IF EXISTS acc_data_schema.activities_submittals_target_ball_in_court_users;
CREATE TABLE acc_data_schema.activities_submittals_target_ball_in_court_users (
    "activity_id"            varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_verb"          varchar,
    "created_at"             timestamp without time zone,
    "display_name"           varchar,
    "human_readable_company" varchar,
    "human_readable_name"    varchar,
    "id"                     varchar,
    "object_type"            varchar,
    "autodesk_id"            varchar,
    "roles"                  varchar
);

--
-- Table: activities_submittals_target_steps
--
DROP TABLE IF EXISTS acc_data_schema.activities_submittals_target_steps;
CREATE TABLE acc_data_schema.activities_submittals_target_steps (
    "activity_id"            varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_verb"          varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "completed_at"           timestamp without time zone,
    "days_to_respond"        numeric,
    "display_name"           varchar,
    "due_date"               date,
    "id"                     uuid,
    "object_type"            varchar,
    "started_at"             timestamp without time zone,
    "status"                 varchar,
    "step_number"            numeric
);

--
-- Table: activities_submittals_target_tasks
--
DROP TABLE IF EXISTS acc_data_schema.activities_submittals_target_tasks;
CREATE TABLE acc_data_schema.activities_submittals_target_tasks (
    "activity_id"            varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_verb"          varchar,
    "created_at"             timestamp without time zone,
    "assigned_to"            varchar,
    "assigned_to_type"       varchar,
    "display_name"           varchar,
    "id"                     uuid,
    "is_required"            boolean,
    "object_type"            varchar,
    "response_comment"       varchar,
    "response_id"            uuid,
    "started_at"             timestamp without time zone,
    "status"                 varchar,
    "step"                   uuid
);

--
-- Table: activities_submittals_target_transition_attachments
--
DROP TABLE IF EXISTS acc_data_schema.activities_submittals_target_transition_attachments;
CREATE TABLE acc_data_schema.activities_submittals_target_transition_attachments (
    "activity_id"            varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_verb"          varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "attachment_category"    varchar,
    "display_name"           varchar,
    "id"                     uuid,
    "item"                   varchar,
    "object_type"            varchar,
    "resource_urns"          varchar,
    "revision"               numeric,
    "urn"                    varchar,
    "urn_type"               varchar
);

--
-- Table: activities_submittals_target_watchers
--
DROP TABLE IF EXISTS acc_data_schema.activities_submittals_target_watchers;
CREATE TABLE acc_data_schema.activities_submittals_target_watchers (
    "activity_id"            varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_verb"          varchar,
    "created_at"             timestamp without time zone,
    "display_name"           varchar,
    "human_readable_company" varchar,
    "human_readable_name"    varchar,
    "id"                     varchar,
    "object_type"            varchar,
    "autodesk_id"            varchar,
    "roles"                  varchar
);

-- =================================================================
-- # Schema: admin
-- =================================================================
--
-- Table: admin_account_services
--
DROP TABLE IF EXISTS acc_data_schema.admin_account_services;
CREATE TABLE acc_data_schema.admin_account_services (
    "bim360_account_id"      uuid,
    "service"                varchar
);

--
-- Table: admin_accounts
--
DROP TABLE IF EXISTS acc_data_schema.admin_accounts;
CREATE TABLE acc_data_schema.admin_accounts (
    "bim360_account_id"      uuid,
    "display_name"           varchar,
    "start_date"             timestamp without time zone,
    "end_date"               timestamp without time zone
);

--
-- Table: admin_business_units
--
DROP TABLE IF EXISTS acc_data_schema.admin_business_units;
CREATE TABLE acc_data_schema.admin_business_units (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "parent_id"              uuid,
    "name"                   varchar,
    "description"            varchar,
    "path"                   varchar
);

--
-- Table: admin_companies
--
DROP TABLE IF EXISTS acc_data_schema.admin_companies;
CREATE TABLE acc_data_schema.admin_companies (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "name"                   varchar,
    "trade"                  varchar,
    "category"               varchar,
    "address_line1"          varchar,
    "address_line2"          varchar,
    "city"                   varchar,
    "state_or_province"      varchar,
    "postal_code"            varchar,
    "country"                varchar,
    "phone"                  varchar,
    "website_url"            varchar,
    "description"            varchar,
    "erp_id"                 varchar,
    "tax_id"                 varchar,
    "status"                 varchar,
    "created_at"             timestamp without time zone,
    "project_size"           numeric,
    "user_size"              numeric,
    "custom_properties"      varchar
);

--
-- Table: admin_project_companies
--
DROP TABLE IF EXISTS acc_data_schema.admin_project_companies;
CREATE TABLE acc_data_schema.admin_project_companies (
    "project_id"             uuid,
    "company_id"             uuid,
    "bim360_account_id"      uuid,
    "company_oxygen_id"      varchar
);

--
-- Table: admin_project_products
--
DROP TABLE IF EXISTS acc_data_schema.admin_project_products;
CREATE TABLE acc_data_schema.admin_project_products (
    "bim360_project_id"      uuid,
    "bim360_account_id"      uuid,
    "product_key"            varchar,
    "status"                 varchar,
    "created_at"             timestamp without time zone
);

--
-- Table: admin_project_roles
--
DROP TABLE IF EXISTS acc_data_schema.admin_project_roles;
CREATE TABLE acc_data_schema.admin_project_roles (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "role_oxygen_id"         varchar,
    "name"                   varchar,
    "status"                 varchar,
    "role_id"                uuid
);

--
-- Table: admin_project_services
--
DROP TABLE IF EXISTS acc_data_schema.admin_project_services;
CREATE TABLE acc_data_schema.admin_project_services (
    "project_id"             uuid,
    "bim360_account_id"      uuid,
    "service"                varchar,
    "status"                 varchar,
    "created_at"             timestamp without time zone
);

--
-- Table: admin_project_user_companies
--
DROP TABLE IF EXISTS acc_data_schema.admin_project_user_companies;
CREATE TABLE acc_data_schema.admin_project_user_companies (
    "bim360_account_id"      uuid,
    "company_oxygen_id"      uuid,
    "project_id"             uuid,
    "user_id"                uuid
);

--
-- Table: admin_project_user_products
--
DROP TABLE IF EXISTS acc_data_schema.admin_project_user_products;
CREATE TABLE acc_data_schema.admin_project_user_products (
    "bim360_project_id"      uuid,
    "bim360_account_id"      uuid,
    "user_id"                uuid,
    "product_key"            varchar,
    "access_level"           varchar,
    "created_at"             timestamp without time zone
);

--
-- Table: admin_project_user_roles
--
DROP TABLE IF EXISTS acc_data_schema.admin_project_user_roles;
CREATE TABLE acc_data_schema.admin_project_user_roles (
    "project_id"             uuid,
    "bim360_account_id"      uuid,
    "user_id"                uuid,
    "role_id"                uuid,
    "created_at"             timestamp without time zone
);

--
-- Table: admin_project_user_services
--
DROP TABLE IF EXISTS acc_data_schema.admin_project_user_services;
CREATE TABLE acc_data_schema.admin_project_user_services (
    "project_id"             uuid,
    "bim360_account_id"      uuid,
    "user_id"                uuid,
    "service"                varchar,
    "role"                   varchar,
    "created_at"             timestamp without time zone
);

--
-- Table: admin_project_users
--
DROP TABLE IF EXISTS acc_data_schema.admin_project_users;
CREATE TABLE acc_data_schema.admin_project_users (
    "bim360_project_id"      uuid,
    "bim360_account_id"      uuid,
    "user_id"                uuid,
    "status"                 varchar,
    "company_id"             uuid,
    "access_level"           varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: admin_projects
--
DROP TABLE IF EXISTS acc_data_schema.admin_projects;
CREATE TABLE acc_data_schema.admin_projects (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "name"                   varchar,
    "start_date"             timestamp without time zone,
    "end_date"               timestamp without time zone,
    "type"                   varchar,
    "value"                  numeric,
    "currency"               varchar,
    "status"                 varchar,
    "job_number"             varchar,
    "address_line1"          varchar,
    "address_line2"          varchar,
    "city"                   varchar,
    "state_or_province"      varchar,
    "postal_code"            varchar,
    "country"                varchar,
    "timezone"               varchar,
    "construction_type"      varchar,
    "contract_type"          varchar,
    "business_unit_id"       uuid,
    "last_sign_in"           timestamp without time zone,
    "created_at"             timestamp without time zone,
    "acc_project"            boolean,
    "latitude"               numeric,
    "longitude"              numeric,
    "updated_at"             timestamp without time zone,
    "status_reason"          varchar,
    "total_member_size"      numeric,
    "total_company_size"     numeric,
    "classification"         varchar
);

--
-- Table: admin_roles
--
DROP TABLE IF EXISTS acc_data_schema.admin_roles;
CREATE TABLE acc_data_schema.admin_roles (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "name"                   varchar,
    "status"                 varchar
);

--
-- Table: admin_users
--
DROP TABLE IF EXISTS acc_data_schema.admin_users;
CREATE TABLE acc_data_schema.admin_users (
    "id"                     uuid,
    "autodesk_id"            varchar,
    "bim360_account_id"      uuid,
    "email"                  varchar,
    "name"                   varchar,
    "first_name"             varchar,
    "last_name"              varchar,
    "address_line1"          varchar,
    "address_line2"          varchar,
    "city"                   varchar,
    "state_or_province"      varchar,
    "postal_code"            varchar,
    "country"                varchar,
    "last_sign_in"           timestamp without time zone,
    "phone"                  varchar,
    "job_title"              varchar,
    "access_level_account_admin" boolean,
    "access_level_project_admin" boolean,
    "access_level_project_member" boolean,
    "access_level_executive" boolean,
    "default_role_id"        uuid,
    "default_company_id"     uuid,
    "status"                 varchar,
    "status_reason"          varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

-- =================================================================
-- # Schema: assets
-- =================================================================
--
-- Table: assets_asset_custom_attribute_values
--
DROP TABLE IF EXISTS acc_data_schema.assets_asset_custom_attribute_values;
CREATE TABLE acc_data_schema.assets_asset_custom_attribute_values (
    "asset_id"               uuid,
    "custom_attribute_id"    uuid,
    "value_boolean"          boolean,
    "value_string"           varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid
);

--
-- Table: assets_asset_model_sync_records
--
DROP TABLE IF EXISTS acc_data_schema.assets_asset_model_sync_records;
CREATE TABLE acc_data_schema.assets_asset_model_sync_records (
    "id"                     uuid,
    "version"                numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "asset_id"               uuid,
    "model_lineage_urn"      varchar,
    "model_object_guid"      varchar,
    "model_external_id"      varchar,
    "synced_model_version_urn" varchar,
    "synced_model_version_number" numeric,
    "model_svf2_id"          numeric,
    "model_lmv_id"           numeric,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "deleted_by"             varchar
);

--
-- Table: assets_asset_permissions
--
DROP TABLE IF EXISTS acc_data_schema.assets_asset_permissions;
CREATE TABLE acc_data_schema.assets_asset_permissions (
    "id"                     uuid,
    "version"                numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "permission_policy_type" varchar,
    "subject_type"           varchar,
    "subject_oxygen_id"      varchar,
    "subject_acs_admin_id"   uuid,
    "resource_type"          varchar,
    "resource_id"            uuid,
    "effect"                 varchar,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "deleted_by"             varchar
);

--
-- Table: assets_asset_stages
--
DROP TABLE IF EXISTS acc_data_schema.assets_asset_stages;
CREATE TABLE acc_data_schema.assets_asset_stages (
    "id"                     uuid,
    "version"                numeric,
    "asset_id"               uuid,
    "bound_type"             varchar,
    "bound_id"               uuid,
    "completed_work"         numeric,
    "max_work"               numeric,
    "unit_of_work"           varchar,
    "started_at"             timestamp without time zone,
    "started_by"             varchar,
    "completed_at"           timestamp without time zone,
    "completed_by"           varchar,
    "completion_status"      varchar,
    "is_current"             boolean,
    "category_id"            uuid,
    "location_id"            uuid,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid
);

--
-- Table: assets_asset_statuses
--
DROP TABLE IF EXISTS acc_data_schema.assets_asset_statuses;
CREATE TABLE acc_data_schema.assets_asset_statuses (
    "id"                     uuid,
    "version"                numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "label"                  varchar,
    "description"            varchar,
    "status_set_id"          uuid,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "sort_order"             numeric
);

--
-- Table: assets_assets
--
DROP TABLE IF EXISTS acc_data_schema.assets_assets;
CREATE TABLE acc_data_schema.assets_assets (
    "id"                     uuid,
    "version"                numeric,
    "client_asset_id"        varchar,
    "description"            varchar,
    "category_id"            varchar,
    "status_id"              uuid,
    "location_id"            uuid,
    "company_id"             uuid,
    "barcode"                varchar,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid
);

--
-- Table: assets_categories
--
DROP TABLE IF EXISTS acc_data_schema.assets_categories;
CREATE TABLE acc_data_schema.assets_categories (
    "id"                     varchar,
    "version"                numeric,
    "name"                   varchar,
    "description"            varchar,
    "parent_id"              varchar,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "uid"                    uuid,
    "category_type"          varchar,
    "parent_uid"             uuid
);

--
-- Table: assets_category_custom_attribute_assignments
--
DROP TABLE IF EXISTS acc_data_schema.assets_category_custom_attribute_assignments;
CREATE TABLE acc_data_schema.assets_category_custom_attribute_assignments (
    "id"                     uuid,
    "version"                numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "category_id"            varchar,
    "custom_attribute_id"    uuid,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "deleted_by"             varchar
);

--
-- Table: assets_category_status_set_assignments
--
DROP TABLE IF EXISTS acc_data_schema.assets_category_status_set_assignments;
CREATE TABLE acc_data_schema.assets_category_status_set_assignments (
    "id"                     uuid,
    "version"                numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "category_id"            varchar,
    "status_set_id"          uuid,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "category_type"          varchar,
    "category_uid"           uuid
);

--
-- Table: assets_custom_attribute_default_values
--
DROP TABLE IF EXISTS acc_data_schema.assets_custom_attribute_default_values;
CREATE TABLE acc_data_schema.assets_custom_attribute_default_values (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "custom_attribute_id"    uuid,
    "default_value_boolean"  boolean,
    "default_value_string"   varchar
);

--
-- Table: assets_custom_attribute_selection_values
--
DROP TABLE IF EXISTS acc_data_schema.assets_custom_attribute_selection_values;
CREATE TABLE acc_data_schema.assets_custom_attribute_selection_values (
    "id"                     uuid,
    "version"                numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "display_name"           varchar,
    "custom_attribute_id"    uuid,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "deleted_by"             varchar
);

--
-- Table: assets_custom_attributes
--
DROP TABLE IF EXISTS acc_data_schema.assets_custom_attributes;
CREATE TABLE acc_data_schema.assets_custom_attributes (
    "id"                     uuid,
    "version"                numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "display_name"           varchar,
    "description"            varchar,
    "data_type"              varchar,
    "required_on_ingress"    boolean,
    "max_length_on_ingress"  numeric,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "deleted_by"             varchar
);

--
-- Table: assets_model_sync_containers
--
DROP TABLE IF EXISTS acc_data_schema.assets_model_sync_containers;
CREATE TABLE acc_data_schema.assets_model_sync_containers (
    "id"                     uuid,
    "version"                numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "model_lineage_urn"      varchar,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "deleted_by"             varchar
);

--
-- Table: assets_status_sets
--
DROP TABLE IF EXISTS acc_data_schema.assets_status_sets;
CREATE TABLE acc_data_schema.assets_status_sets (
    "id"                     uuid,
    "version"                numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "description"            varchar,
    "is_default"             boolean,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "deleted_by"             varchar
);

--
-- Table: assets_system_memberships
--
DROP TABLE IF EXISTS acc_data_schema.assets_system_memberships;
CREATE TABLE acc_data_schema.assets_system_memberships (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "system_id"              uuid,
    "member_type"            varchar,
    "member_id"              uuid
);

--
-- Table: assets_systems
--
DROP TABLE IF EXISTS acc_data_schema.assets_systems;
CREATE TABLE acc_data_schema.assets_systems (
    "id"                     uuid,
    "version"                numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "description"            varchar,
    "category_uid"           uuid,
    "status_id"              uuid,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "deleted_by"             varchar
);

-- =================================================================
-- # Schema: cdcadmin
-- =================================================================
--
-- Table: cdcadmin_account_services
--
DROP TABLE IF EXISTS acc_data_schema.cdcadmin_account_services;
CREATE TABLE acc_data_schema.cdcadmin_account_services (
    "bim360_account_id"      uuid,
    "service"                varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcadmin_accounts
--
DROP TABLE IF EXISTS acc_data_schema.cdcadmin_accounts;
CREATE TABLE acc_data_schema.cdcadmin_accounts (
    "bim360_account_id"      uuid,
    "display_name"           varchar,
    "start_date"             timestamp without time zone,
    "end_date"               timestamp without time zone,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcadmin_companies
--
DROP TABLE IF EXISTS acc_data_schema.cdcadmin_companies;
CREATE TABLE acc_data_schema.cdcadmin_companies (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "name"                   varchar,
    "trade"                  varchar,
    "category"               varchar,
    "address_line1"          varchar,
    "address_line2"          varchar,
    "city"                   varchar,
    "state_or_province"      varchar,
    "postal_code"            varchar,
    "country"                varchar,
    "phone"                  varchar,
    "website_url"            varchar,
    "description"            varchar,
    "erp_id"                 varchar,
    "tax_id"                 varchar,
    "status"                 varchar,
    "created_at"             timestamp without time zone,
    "project_size"           numeric,
    "user_size"              numeric,
    "custom_properties"      varchar,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcadmin_project_companies
--
DROP TABLE IF EXISTS acc_data_schema.cdcadmin_project_companies;
CREATE TABLE acc_data_schema.cdcadmin_project_companies (
    "project_id"             uuid,
    "company_id"             uuid,
    "bim360_account_id"      uuid,
    "company_oxygen_id"      varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcadmin_project_products
--
DROP TABLE IF EXISTS acc_data_schema.cdcadmin_project_products;
CREATE TABLE acc_data_schema.cdcadmin_project_products (
    "bim360_project_id"      uuid,
    "bim360_account_id"      uuid,
    "product_key"            varchar,
    "status"                 varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcadmin_project_roles
--
DROP TABLE IF EXISTS acc_data_schema.cdcadmin_project_roles;
CREATE TABLE acc_data_schema.cdcadmin_project_roles (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "role_oxygen_id"         varchar,
    "name"                   varchar,
    "status"                 varchar,
    "role_id"                uuid,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcadmin_project_services
--
DROP TABLE IF EXISTS acc_data_schema.cdcadmin_project_services;
CREATE TABLE acc_data_schema.cdcadmin_project_services (
    "project_id"             uuid,
    "bim360_account_id"      uuid,
    "service"                varchar,
    "status"                 varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcadmin_project_user_companies
--
DROP TABLE IF EXISTS acc_data_schema.cdcadmin_project_user_companies;
CREATE TABLE acc_data_schema.cdcadmin_project_user_companies (
    "bim360_account_id"      uuid,
    "company_oxygen_id"      uuid,
    "project_id"             uuid,
    "user_id"                uuid,
    "status"                 varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcadmin_project_user_roles
--
DROP TABLE IF EXISTS acc_data_schema.cdcadmin_project_user_roles;
CREATE TABLE acc_data_schema.cdcadmin_project_user_roles (
    "project_id"             uuid,
    "bim360_account_id"      uuid,
    "user_id"                uuid,
    "role_id"                uuid,
    "created_at"             timestamp without time zone,
    "bim360_project_id"      uuid,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcadmin_project_users
--
DROP TABLE IF EXISTS acc_data_schema.cdcadmin_project_users;
CREATE TABLE acc_data_schema.cdcadmin_project_users (
    "bim360_project_id"      uuid,
    "bim360_account_id"      uuid,
    "user_id"                uuid,
    "status"                 varchar,
    "company_id"             uuid,
    "access_level"           varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcadmin_projects
--
DROP TABLE IF EXISTS acc_data_schema.cdcadmin_projects;
CREATE TABLE acc_data_schema.cdcadmin_projects (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "name"                   varchar,
    "start_date"             timestamp without time zone,
    "end_date"               timestamp without time zone,
    "type"                   varchar,
    "value"                  numeric,
    "currency"               varchar,
    "status"                 varchar,
    "job_number"             varchar,
    "address_line1"          varchar,
    "address_line2"          varchar,
    "city"                   varchar,
    "state_or_province"      varchar,
    "postal_code"            varchar,
    "country"                varchar,
    "timezone"               varchar,
    "construction_type"      varchar,
    "contract_type"          varchar,
    "business_unit_id"       uuid,
    "last_sign_in"           timestamp without time zone,
    "created_at"             timestamp without time zone,
    "acc_project"            boolean,
    "latitude"               numeric,
    "longitude"              numeric,
    "updated_at"             timestamp without time zone,
    "status_reason"          varchar,
    "total_member_size"      numeric,
    "total_company_size"     numeric,
    "classification"         varchar,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcadmin_roles
--
DROP TABLE IF EXISTS acc_data_schema.cdcadmin_roles;
CREATE TABLE acc_data_schema.cdcadmin_roles (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "name"                   varchar,
    "status"                 varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcadmin_users
--
DROP TABLE IF EXISTS acc_data_schema.cdcadmin_users;
CREATE TABLE acc_data_schema.cdcadmin_users (
    "id"                     uuid,
    "autodesk_id"            varchar,
    "bim360_account_id"      uuid,
    "email"                  varchar,
    "name"                   varchar,
    "first_name"             varchar,
    "last_name"              varchar,
    "address_line1"          varchar,
    "address_line2"          varchar,
    "city"                   varchar,
    "state_or_province"      varchar,
    "postal_code"            varchar,
    "country"                varchar,
    "last_sign_in"           timestamp without time zone,
    "phone"                  varchar,
    "job_title"              varchar,
    "access_level_account_admin" boolean,
    "access_level_project_admin" boolean,
    "access_level_project_member" boolean,
    "access_level_executive" boolean,
    "default_role_id"        uuid,
    "default_company_id"     uuid,
    "status"                 varchar,
    "status_reason"          varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

-- =================================================================
-- # Schema: cdccost
-- =================================================================
--
-- Table: cdccost_approval_workflows
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_approval_workflows;
CREATE TABLE acc_data_schema.cdccost_approval_workflows (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "association_id"         uuid,
    "association_type"       varchar,
    "current_step_name"      varchar,
    "current_assigned_users" varchar,
    "current_assigned_groups" varchar,
    "reviewed_users"         varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "current_due_date"       timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_budget_code_segment_codes
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_budget_code_segment_codes;
CREATE TABLE acc_data_schema.cdccost_budget_code_segment_codes (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "parent_id"              uuid,
    "segment_id"             uuid,
    "code"                   varchar,
    "original_code"          varchar,
    "description"            varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_budget_code_segments
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_budget_code_segments;
CREATE TABLE acc_data_schema.cdccost_budget_code_segments (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "length"                 numeric,
    "position"               numeric,
    "type"                   varchar,
    "delimiter"              varchar,
    "sample_code"            varchar,
    "is_variable_length"     boolean,
    "is_locked"              boolean,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_budget_payment_items
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_budget_payment_items;
CREATE TABLE acc_data_schema.cdccost_budget_payment_items (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "payment_id"             uuid,
    "parent_id"              uuid,
    "number"                 varchar,
    "name"                   varchar,
    "description"            varchar,
    "unit"                   varchar,
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
    "status"                 varchar,
    "creator_id"             varchar,
    "changed_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_budget_payment_properties
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_budget_payment_properties;
CREATE TABLE acc_data_schema.cdccost_budget_payment_properties (
    "budget_payment_id"      uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "built_in"               boolean,
    "position"               numeric,
    "property_definition_id" uuid,
    "type"                   varchar,
    "value"                  varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_budget_payments
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_budget_payments;
CREATE TABLE acc_data_schema.cdccost_budget_payments (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "main_contract_id"       uuid,
    "start_date"             timestamp without time zone,
    "end_date"               timestamp without time zone,
    "due_date"               timestamp without time zone,
    "number"                 varchar,
    "name"                   varchar,
    "description"            varchar,
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
    "status"                 varchar,
    "company_id"             varchar,
    "payment_type"           varchar,
    "payment_reference"      varchar,
    "creator_id"             varchar,
    "changed_by"             varchar,
    "contact_id"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "approved_at"            timestamp without time zone,
    "paid_at"                timestamp without time zone,
    "submitted_at"           timestamp without time zone,
    "note"                   varchar,
    "materials_billed"       numeric,
    "materials_retention"    numeric,
    "integration_state"      varchar,
    "integration_state_changed_by" varchar,
    "integration_state_changed_at" timestamp without time zone,
    "external_id"            varchar,
    "external_system"        varchar,
    "message"                varchar,
    "last_sync_time"         timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_budget_properties
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_budget_properties;
CREATE TABLE acc_data_schema.cdccost_budget_properties (
    "budget_id"              uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "built_in"               boolean,
    "position"               numeric,
    "property_definition_id" uuid,
    "type"                   varchar,
    "value"                  varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_budget_transfers
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_budget_transfers;
CREATE TABLE acc_data_schema.cdccost_budget_transfers (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "number"                 varchar,
    "name"                   varchar,
    "note"                   varchar,
    "status"                 varchar,
    "approved_at"            timestamp without time zone,
    "creator_id"             varchar,
    "changed_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "integration_state"      varchar,
    "integration_state_changed_by" varchar,
    "integration_state_changed_at" timestamp without time zone,
    "external_id"            varchar,
    "external_system"        varchar,
    "message"                varchar,
    "last_sync_time"         timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_budgets
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_budgets;
CREATE TABLE acc_data_schema.cdccost_budgets (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "parent_id"              uuid,
    "code"                   varchar,
    "name"                   varchar,
    "description"            varchar,
    "quantity"               numeric,
    "unit_price"             numeric,
    "unit"                   varchar,
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
    "main_contract_id"       uuid,
    "contract_id"            uuid,
    "adjustments_total"      numeric,
    "uncommitted"            numeric,
    "revised"                numeric,
    "projected_cost"         numeric,
    "projected_budget"       numeric,
    "forecast_final_cost"    numeric,
    "forecast_variance"      numeric,
    "forecast_cost_complete" numeric,
    "variance_total"         numeric,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "original_contracted"    numeric,
    "compounded"             varchar,
    "integration_state"      varchar,
    "integration_state_changed_by" varchar,
    "integration_state_changed_at" timestamp without time zone,
    "external_id"            varchar,
    "external_system"        varchar,
    "message"                varchar,
    "last_sync_time"         timestamp without time zone,
    "pending_internal_budget_transfer" numeric,
    "pending_internal_budget_transfer_qty" numeric,
    "pending_internal_budget_transfer_input_qty" numeric,
    "code_segment_values"    varchar,
    "main_contract_item_amount" numeric,
    "approved_cost_payment_application" numeric,
    "approved_budget_payment_application" numeric,
    "locations"              varchar,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_change_order_cost_items
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_change_order_cost_items;
CREATE TABLE acc_data_schema.cdccost_change_order_cost_items (
    "change_order_id"        uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "cost_item_id"           uuid,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_change_order_properties
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_change_order_properties;
CREATE TABLE acc_data_schema.cdccost_change_order_properties (
    "change_order_id"        uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "built_in"               boolean,
    "position"               numeric,
    "property_definition_id" uuid,
    "type"                   varchar,
    "value"                  varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_change_orders
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_change_orders;
CREATE TABLE acc_data_schema.cdccost_change_orders (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "number"                 varchar,
    "name"                   varchar,
    "description"            varchar,
    "creator_id"             varchar,
    "owner_id"               varchar,
    "changed_by"             varchar,
    "contract_id"            uuid,
    "form_type"              varchar,
    "markup_formula_id"      uuid,
    "applied_by"             varchar,
    "applied_at"             timestamp without time zone,
    "budget_status"          varchar,
    "cost_status"            varchar,
    "scope_of_work"          varchar,
    "note"                   varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "type"                   varchar,
    "schedule_change"        numeric,
    "integration_state"      varchar,
    "integration_state_changed_by" varchar,
    "integration_state_changed_at" timestamp without time zone,
    "external_id"            varchar,
    "external_system"        varchar,
    "message"                varchar,
    "last_sync_time"         timestamp without time zone,
    "proposed_revised_completion_date" timestamp without time zone,
    "source_type"            varchar,
    "approved_at"            timestamp without time zone,
    "status_changed_at"      timestamp without time zone,
    "main_contract_id"       uuid,
    "quantity"               numeric,
    "unit"                   varchar,
    "estimated"              numeric,
    "proposed"               numeric,
    "submitted"              numeric,
    "approved"               numeric,
    "committed"              numeric,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_contract_properties
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_contract_properties;
CREATE TABLE acc_data_schema.cdccost_contract_properties (
    "contract_id"            uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "built_in"               boolean,
    "position"               numeric,
    "property_definition_id" uuid,
    "type"                   varchar,
    "value"                  varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_contracts
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_contracts;
CREATE TABLE acc_data_schema.cdccost_contracts (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "code"                   varchar,
    "name"                   varchar,
    "description"            varchar,
    "company_id"             varchar,
    "type"                   varchar,
    "contact_id"             varchar,
    "creator_id"             varchar,
    "signed_by"              varchar,
    "owner_id"               varchar,
    "changed_by"             varchar,
    "status"                 varchar,
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
    "awarded_at"             timestamp without time zone,
    "status_changed_at"      timestamp without time zone,
    "sent_at"                timestamp without time zone,
    "responded_at"           timestamp without time zone,
    "returned_at"            timestamp without time zone,
    "onsite_at"              timestamp without time zone,
    "offsite_at"             timestamp without time zone,
    "procured_at"            timestamp without time zone,
    "approved_at"            timestamp without time zone,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "scope_of_work"          varchar,
    "note"                   varchar,
    "adjustments_total"      numeric,
    "executed_at"            timestamp without time zone,
    "currency"               varchar,
    "exchange_rate"          numeric,
    "integration_state"      varchar,
    "integration_state_changed_by" varchar,
    "integration_state_changed_at" timestamp without time zone,
    "external_id"            varchar,
    "external_system"        varchar,
    "message"                varchar,
    "last_sync_time"         timestamp without time zone,
    "pending_internal_budget_transfer" numeric,
    "compliance_status"      varchar,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar,
    "awarded_tax_total"      numeric
);

--
-- Table: cdccost_cost_item_properties
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_cost_item_properties;
CREATE TABLE acc_data_schema.cdccost_cost_item_properties (
    "cost_item_id"           uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "built_in"               boolean,
    "position"               numeric,
    "property_definition_id" uuid,
    "type"                   varchar,
    "value"                  varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_cost_items
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_cost_items;
CREATE TABLE acc_data_schema.cdccost_cost_items (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "number"                 varchar,
    "name"                   varchar,
    "description"            varchar,
    "budget_id"              uuid,
    "budget_status"          varchar,
    "cost_status"            varchar,
    "scope"                  varchar,
    "type"                   varchar,
    "estimated"              numeric,
    "proposed"               numeric,
    "submitted"              numeric,
    "approved"               numeric,
    "committed"              numeric,
    "scope_of_work"          varchar,
    "note"                   varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "schedule_change"        numeric,
    "approved_tax_summary"   varchar,
    "committed_tax_summary"  varchar,
    "estimated_tax_summary"  varchar,
    "proposed_tax_summary"   varchar,
    "submitted_tax_summary"  varchar,
    "is_markup"              boolean,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_cost_payment_items
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_cost_payment_items;
CREATE TABLE acc_data_schema.cdccost_cost_payment_items (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "payment_id"             uuid,
    "parent_id"              uuid,
    "number"                 varchar,
    "name"                   varchar,
    "description"            varchar,
    "unit"                   varchar,
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
    "status"                 varchar,
    "creator_id"             varchar,
    "changed_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "tax_summary"            varchar,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_cost_payment_properties
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_cost_payment_properties;
CREATE TABLE acc_data_schema.cdccost_cost_payment_properties (
    "cost_payment_id"        uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "built_in"               boolean,
    "position"               numeric,
    "property_definition_id" uuid,
    "type"                   varchar,
    "value"                  varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_cost_payments
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_cost_payments;
CREATE TABLE acc_data_schema.cdccost_cost_payments (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "contract_id"            uuid,
    "start_date"             timestamp without time zone,
    "end_date"               timestamp without time zone,
    "due_date"               timestamp without time zone,
    "number"                 varchar,
    "name"                   varchar,
    "description"            varchar,
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
    "status"                 varchar,
    "company_id"             varchar,
    "payment_type"           varchar,
    "payment_reference"      varchar,
    "creator_id"             varchar,
    "changed_by"             varchar,
    "contact_id"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "approved_at"            timestamp without time zone,
    "paid_at"                timestamp without time zone,
    "submitted_at"           timestamp without time zone,
    "note"                   varchar,
    "materials_billed"       numeric,
    "materials_retention"    numeric,
    "integration_state"      varchar,
    "integration_state_changed_by" varchar,
    "integration_state_changed_at" timestamp without time zone,
    "external_id"            varchar,
    "external_system"        varchar,
    "message"                varchar,
    "last_sync_time"         timestamp without time zone,
    "tax_summary"            varchar,
    "compliance_status"      varchar,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_distribution_item_curves
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_distribution_item_curves;
CREATE TABLE acc_data_schema.cdccost_distribution_item_curves (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "distribution_item_id"   uuid,
    "actual_total"           numeric,
    "distribution_total"     numeric,
    "curve"                  varchar,
    "periods"                varchar,
    "actual_total_input_qty" numeric,
    "distribution_total_input_qty" numeric,
    "periods_input_qty"      varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_distribution_items
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_distribution_items;
CREATE TABLE acc_data_schema.cdccost_distribution_items (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "budget_id"              varchar,
    "association_id"         uuid,
    "association_type"       varchar,
    "number"                 varchar,
    "name"                   varchar,
    "status"                 varchar,
    "due_date"               timestamp without time zone,
    "company_id"             uuid,
    "contact_id"             varchar,
    "creator_id"             varchar,
    "changed_by"             varchar,
    "submitted_at"           timestamp without time zone,
    "accepted_at"            timestamp without time zone,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_expense_items
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_expense_items;
CREATE TABLE acc_data_schema.cdccost_expense_items (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "expense_id"             uuid,
    "budget_id"              uuid,
    "contract_id"            uuid,
    "number"                 varchar,
    "name"                   varchar,
    "description"            varchar,
    "unit"                   varchar,
    "unit_price"             numeric,
    "quantity"               numeric,
    "amount"                 numeric,
    "tax"                    numeric,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_expense_properties
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_expense_properties;
CREATE TABLE acc_data_schema.cdccost_expense_properties (
    "expense_id"             uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "built_in"               boolean,
    "position"               numeric,
    "property_definition_id" uuid,
    "type"                   varchar,
    "value"                  varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_expenses
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_expenses;
CREATE TABLE acc_data_schema.cdccost_expenses (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "number"                 varchar,
    "name"                   varchar,
    "description"            varchar,
    "creator_id"             varchar,
    "changed_by"             varchar,
    "supplier_id"            varchar,
    "supplier_name"          varchar,
    "amount"                 numeric,
    "paid_amount"            numeric,
    "status"                 varchar,
    "type"                   varchar,
    "payment_type"           varchar,
    "payment_reference"      varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "issued_at"              timestamp without time zone,
    "received_at"            timestamp without time zone,
    "approved_at"            timestamp without time zone,
    "paid_at"                timestamp without time zone,
    "reference_number"       varchar,
    "integration_state"      varchar,
    "integration_state_changed_by" varchar,
    "integration_state_changed_at" timestamp without time zone,
    "external_id"            varchar,
    "external_system"        varchar,
    "message"                varchar,
    "last_sync_time"         timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_main_contract_items
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_main_contract_items;
CREATE TABLE acc_data_schema.cdccost_main_contract_items (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "main_contract_id"       uuid,
    "budget_id"              uuid,
    "parent_id"              uuid,
    "code"                   varchar,
    "name"                   varchar,
    "description"            varchar,
    "qty"                    numeric,
    "unit_price"             numeric,
    "unit"                   varchar,
    "amount"                 numeric,
    "changed_by"             varchar,
    "is_private"             boolean,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_main_contract_properties
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_main_contract_properties;
CREATE TABLE acc_data_schema.cdccost_main_contract_properties (
    "main_contract_id"       uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "built_in"               boolean,
    "position"               numeric,
    "property_definition_id" uuid,
    "type"                   varchar,
    "value"                  varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_main_contracts
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_main_contracts;
CREATE TABLE acc_data_schema.cdccost_main_contracts (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "code"                   varchar,
    "name"                   varchar,
    "description"            varchar,
    "type"                   varchar,
    "status"                 varchar,
    "amount"                 numeric,
    "retention_cap"          numeric,
    "contact_id"             varchar,
    "creator_id"             varchar,
    "owner_id"               varchar,
    "changed_by"             varchar,
    "scope_of_work"          varchar,
    "note"                   varchar,
    "start_date"             timestamp without time zone,
    "executed_date"          timestamp without time zone,
    "planned_completion_date" timestamp without time zone,
    "actual_completion_date" timestamp without time zone,
    "close_date"             timestamp without time zone,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "revised_completion_date" timestamp without time zone,
    "schedule_change"        numeric,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_payment_references
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_payment_references;
CREATE TABLE acc_data_schema.cdccost_payment_references (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "amount"                 numeric,
    "type"                   varchar,
    "reference"              varchar,
    "paid_at"                timestamp without time zone,
    "association_id"         uuid,
    "association_type"       varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_permissions
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_permissions;
CREATE TABLE acc_data_schema.cdccost_permissions (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "policy_id"              uuid,
    "subject_id"             varchar,
    "subject_type"           varchar,
    "permission_level"       varchar,
    "resource_type"          varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_schedule_of_values_properties
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_schedule_of_values_properties;
CREATE TABLE acc_data_schema.cdccost_schedule_of_values_properties (
    "schedule_of_value_id"   uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "built_in"               boolean,
    "position"               numeric,
    "property_definition_id" uuid,
    "type"                   varchar,
    "value"                  varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_sub_distribution_items
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_sub_distribution_items;
CREATE TABLE acc_data_schema.cdccost_sub_distribution_items (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "distribution_item_id"   uuid,
    "association_id"         varchar,
    "association_type"       varchar,
    "number"                 varchar,
    "name"                   varchar,
    "start_date"             date,
    "end_date"               date,
    "actual_total"           numeric,
    "distribution_total"     numeric,
    "type"                   varchar,
    "curve"                  varchar,
    "periods"                varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "actual_total_input_qty" numeric,
    "distribution_total_input_qty" numeric,
    "periods_input_qty"      varchar,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdccost_transferences
--
DROP TABLE IF EXISTS acc_data_schema.cdccost_transferences;
CREATE TABLE acc_data_schema.cdccost_transferences (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "budget_id"              uuid,
    "relating_budget_id"     uuid,
    "contract_id"            uuid,
    "relating_contract_id"   uuid,
    "transaction_id"         uuid,
    "amount"                 numeric,
    "unit_price"             numeric,
    "qty"                    numeric,
    "input_qty"              numeric,
    "relating_unit_price"    numeric,
    "relating_qty"           numeric,
    "relating_input_qty"     numeric,
    "creator_id"             varchar,
    "note"                   varchar,
    "main_contract_id"       uuid,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

-- =================================================================
-- # Schema: cdciq
-- =================================================================
--
-- Table: cdciq_company_daily_quality_risk_changes
--
DROP TABLE IF EXISTS acc_data_schema.cdciq_company_daily_quality_risk_changes;
CREATE TABLE acc_data_schema.cdciq_company_daily_quality_risk_changes (
    "id"                     uuid,
    "company_id"             uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "start_time"             timestamp without time zone,
    "daily_risk"             varchar,
    "daily_risk_indicator"   numeric,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdciq_company_daily_safety_risk_changes
--
DROP TABLE IF EXISTS acc_data_schema.cdciq_company_daily_safety_risk_changes;
CREATE TABLE acc_data_schema.cdciq_company_daily_safety_risk_changes (
    "id"                     uuid,
    "company_id"             uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "start_date"             timestamp without time zone,
    "daily_safety_risk"      numeric,
    "daily_safety_risk_indicator" numeric,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdciq_cost_impact_issues
--
DROP TABLE IF EXISTS acc_data_schema.cdciq_cost_impact_issues;
CREATE TABLE acc_data_schema.cdciq_cost_impact_issues (
    "id"                     uuid,
    "issue_updated_at"       timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "cost_impact"            varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "created_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdciq_design_issues_building_components
--
DROP TABLE IF EXISTS acc_data_schema.cdciq_design_issues_building_components;
CREATE TABLE acc_data_schema.cdciq_design_issues_building_components (
    "id"                     uuid,
    "issue_updated_at"       timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "building_components_keywords" varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "building_components"    varchar,
    "user_building_components" varchar,
    "created_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdciq_design_issues_root_cause
--
DROP TABLE IF EXISTS acc_data_schema.cdciq_design_issues_root_cause;
CREATE TABLE acc_data_schema.cdciq_design_issues_root_cause (
    "id"                     uuid,
    "issue_updated_at"       timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "root_causes"            varchar,
    "user_root_causes"       varchar,
    "created_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdciq_inspection_risk_issues
--
DROP TABLE IF EXISTS acc_data_schema.cdciq_inspection_risk_issues;
CREATE TABLE acc_data_schema.cdciq_inspection_risk_issues (
    "id"                     uuid,
    "issue_updated_at"       timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "inspection_risk"        boolean,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "user_categories"        varchar,
    "created_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdciq_issues_quality_categories
--
DROP TABLE IF EXISTS acc_data_schema.cdciq_issues_quality_categories;
CREATE TABLE acc_data_schema.cdciq_issues_quality_categories (
    "id"                     uuid,
    "updated_at"             timestamp without time zone,
    "issue_updated_at"       timestamp without time zone,
    "category"               varchar,
    "user_category"          varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "created_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdciq_issues_quality_risks
--
DROP TABLE IF EXISTS acc_data_schema.cdciq_issues_quality_risks;
CREATE TABLE acc_data_schema.cdciq_issues_quality_risks (
    "id"                     uuid,
    "updated_at"             timestamp without time zone,
    "risk"                   varchar,
    "issue_updated_at"       timestamp without time zone,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "user_risk"              varchar,
    "created_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdciq_issues_safety_hazard
--
DROP TABLE IF EXISTS acc_data_schema.cdciq_issues_safety_hazard;
CREATE TABLE acc_data_schema.cdciq_issues_safety_hazard (
    "id"                     uuid,
    "issue_updated_at"       timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "safety_hazard_categories" varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "created_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdciq_issues_safety_observations
--
DROP TABLE IF EXISTS acc_data_schema.cdciq_issues_safety_observations;
CREATE TABLE acc_data_schema.cdciq_issues_safety_observations (
    "id"                     uuid,
    "issue_updated_at"       timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "safety_observation_category" varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "created_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdciq_issues_safety_risk
--
DROP TABLE IF EXISTS acc_data_schema.cdciq_issues_safety_risk;
CREATE TABLE acc_data_schema.cdciq_issues_safety_risk (
    "id"                     uuid,
    "issue_updated_at"       timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "safety_risk_category"   varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "created_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdciq_project_daily_quality_risk_changes
--
DROP TABLE IF EXISTS acc_data_schema.cdciq_project_daily_quality_risk_changes;
CREATE TABLE acc_data_schema.cdciq_project_daily_quality_risk_changes (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "start_time"             timestamp without time zone,
    "daily_risk"             varchar,
    "daily_risk_indicator"   numeric,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdciq_rfis_building_components
--
DROP TABLE IF EXISTS acc_data_schema.cdciq_rfis_building_components;
CREATE TABLE acc_data_schema.cdciq_rfis_building_components (
    "id"                     uuid,
    "rfi_updated_at"         timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "building_components"    varchar,
    "building_components_keywords" varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "created_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdciq_rfis_disciplines
--
DROP TABLE IF EXISTS acc_data_schema.cdciq_rfis_disciplines;
CREATE TABLE acc_data_schema.cdciq_rfis_disciplines (
    "id"                     uuid,
    "rfi_updated_at"         timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "disciplines"            varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "created_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdciq_rfis_high_risk
--
DROP TABLE IF EXISTS acc_data_schema.cdciq_rfis_high_risk;
CREATE TABLE acc_data_schema.cdciq_rfis_high_risk (
    "id"                     uuid,
    "rfi_updated_at"         timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "risk"                   varchar,
    "score"                  numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "created_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdciq_rfis_root_cause
--
DROP TABLE IF EXISTS acc_data_schema.cdciq_rfis_root_cause;
CREATE TABLE acc_data_schema.cdciq_rfis_root_cause (
    "id"                     uuid,
    "rfi_updated_at"         timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "root_causes"            varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "created_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

-- =================================================================
-- # Schema: cdcissues
-- =================================================================
--
-- Table: cdcissues_attachments
--
DROP TABLE IF EXISTS acc_data_schema.cdcissues_attachments;
CREATE TABLE acc_data_schema.cdcissues_attachments (
    "attachment_id"          uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "issue_id"               uuid,
    "display_name"           varchar,
    "file_name"              varchar,
    "storage_urn"            varchar,
    "file_size"              numeric,
    "file_type"              varchar,
    "lineage_urn"            varchar,
    "version"                numeric,
    "version_urn"            varchar,
    "tip_version_urn"        varchar,
    "bubble_urn"             varchar,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "adsk_row_id"            varchar
);

--
-- Table: cdcissues_comments
--
DROP TABLE IF EXISTS acc_data_schema.cdcissues_comments;
CREATE TABLE acc_data_schema.cdcissues_comments (
    "comment_id"             uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "issue_id"               uuid,
    "comment_body"           varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcissues_custom_attribute_list_values
--
DROP TABLE IF EXISTS acc_data_schema.cdcissues_custom_attribute_list_values;
CREATE TABLE acc_data_schema.cdcissues_custom_attribute_list_values (
    "attribute_mappings_id"  uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "list_id"                uuid,
    "list_value"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcissues_custom_attributes
--
DROP TABLE IF EXISTS acc_data_schema.cdcissues_custom_attributes;
CREATE TABLE acc_data_schema.cdcissues_custom_attributes (
    "issue_id"               uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "mapped_item_type"       varchar,
    "attribute_mapping_id"   uuid,
    "attribute_title"        varchar,
    "attribute_description"  varchar,
    "attribute_data_type"    varchar,
    "is_required"            boolean,
    "attribute_value"        varchar,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "adsk_row_id"            varchar
);

--
-- Table: cdcissues_custom_attributes_mappings
--
DROP TABLE IF EXISTS acc_data_schema.cdcissues_custom_attributes_mappings;
CREATE TABLE acc_data_schema.cdcissues_custom_attributes_mappings (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "mapped_item_type"       varchar,
    "mapped_item_id"         uuid,
    "title"                  varchar,
    "description"            varchar,
    "data_type"              varchar,
    "order"                  numeric,
    "is_required"            boolean,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcissues_issue_subtypes
--
DROP TABLE IF EXISTS acc_data_schema.cdcissues_issue_subtypes;
CREATE TABLE acc_data_schema.cdcissues_issue_subtypes (
    "issue_subtype_id"       uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "issue_type_id"          uuid,
    "issue_subtype"          varchar,
    "is_active"              boolean,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcissues_issue_types
--
DROP TABLE IF EXISTS acc_data_schema.cdcissues_issue_types;
CREATE TABLE acc_data_schema.cdcissues_issue_types (
    "issue_type_id"          uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "issue_type"             varchar,
    "is_active"              boolean,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcissues_issues
--
DROP TABLE IF EXISTS acc_data_schema.cdcissues_issues;
CREATE TABLE acc_data_schema.cdcissues_issues (
    "issue_id"               uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "display_id"             numeric,
    "title"                  varchar,
    "description"            varchar,
    "type_id"                uuid,
    "subtype_id"             uuid,
    "status"                 varchar,
    "assignee_id"            varchar,
    "assignee_type"          varchar,
    "due_date"               timestamp without time zone,
    "location_id"            uuid,
    "location_details"       varchar,
    "linked_document_urn"    varchar,
    "owner_id"               varchar,
    "root_cause_id"          uuid,
    "root_cause_category_id" uuid,
    "response"               varchar,
    "response_by"            varchar,
    "response_at"            timestamp without time zone,
    "opened_by"              varchar,
    "opened_at"              timestamp without time zone,
    "closed_by"              varchar,
    "closed_at"              timestamp without time zone,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "start_date"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "snapshot_urn"           varchar,
    "published"              boolean,
    "gps_coordinates"        varchar,
    "deleted_by"             varchar,
    "adsk_row_id"            varchar
);

--
-- Table: cdcissues_placements
--
DROP TABLE IF EXISTS acc_data_schema.cdcissues_placements;
CREATE TABLE acc_data_schema.cdcissues_placements (
    "placement_id"           uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "issue_id"               uuid,
    "lineage_urn"            varchar,
    "type"                   varchar,
    "created_at_version"     numeric,
    "origin_product"         varchar,
    "origin_tool"            varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcissues_root_cause_categories
--
DROP TABLE IF EXISTS acc_data_schema.cdcissues_root_cause_categories;
CREATE TABLE acc_data_schema.cdcissues_root_cause_categories (
    "root_cause_category_id" uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "root_cause_category"    varchar,
    "is_active"              boolean,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "is_system"              boolean,
    "adsk_row_id"            varchar
);

--
-- Table: cdcissues_root_causes
--
DROP TABLE IF EXISTS acc_data_schema.cdcissues_root_causes;
CREATE TABLE acc_data_schema.cdcissues_root_causes (
    "root_cause_id"          uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "root_cause_category_id" uuid,
    "title"                  varchar,
    "is_active"              boolean,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "is_system"              boolean,
    "adsk_row_id"            varchar
);

--
-- Table: cdcissues_viewables
--
DROP TABLE IF EXISTS acc_data_schema.cdcissues_viewables;
CREATE TABLE acc_data_schema.cdcissues_viewables (
    "placement_id"           uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "issue_id"               uuid,
    "file_version"           numeric,
    "file_version_urn"       varchar,
    "guid"                   varchar,
    "name"                   varchar,
    "viewable_id"            varchar,
    "is_3d"                  boolean,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

-- =================================================================
-- # Schema: cdclocations
-- =================================================================
--
-- Table: cdclocations_nodes
--
DROP TABLE IF EXISTS acc_data_schema.cdclocations_nodes;
CREATE TABLE acc_data_schema.cdclocations_nodes (
    "tree_id"                uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "parent_id"              uuid,
    "id"                     uuid,
    "name"                   varchar,
    "order"                  numeric,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdclocations_trees
--
DROP TABLE IF EXISTS acc_data_schema.cdclocations_trees;
CREATE TABLE acc_data_schema.cdclocations_trees (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

-- =================================================================
-- # Schema: cdcmarkups
-- =================================================================
--
-- Table: cdcmarkups_layer
--
DROP TABLE IF EXISTS acc_data_schema.cdcmarkups_layer;
CREATE TABLE acc_data_schema.cdcmarkups_layer (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "uid"                    uuid,
    "surface_uid"            uuid,
    "name"                   varchar,
    "promotable"             boolean,
    "surface_type"           varchar,
    "base_entity_urn"        varchar,
    "base_entity_uid"        uuid,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcmarkups_link
--
DROP TABLE IF EXISTS acc_data_schema.cdcmarkups_link;
CREATE TABLE acc_data_schema.cdcmarkups_link (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "uid"                    uuid,
    "markup_id"              numeric,
    "type"                   varchar,
    "destination"            uuid,
    "uri"                    varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "deleted"                boolean,
    "deleted_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcmarkups_markup
--
DROP TABLE IF EXISTS acc_data_schema.cdcmarkups_markup;
CREATE TABLE acc_data_schema.cdcmarkups_markup (
    "id"                     numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "uid"                    uuid,
    "feature_bound_uid"      uuid,
    "feature_bound_type"     varchar,
    "type"                   varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted"                boolean,
    "deleted_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "markup_text"            varchar,
    "adsk_row_id"            varchar
);

--
-- Table: cdcmarkups_placement
--
DROP TABLE IF EXISTS acc_data_schema.cdcmarkups_placement;
CREATE TABLE acc_data_schema.cdcmarkups_placement (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "markup_uid"             uuid,
    "surface_uid"            uuid,
    "published"              boolean,
    "layer_uid"              uuid,
    "id"                     numeric,
    "uid"                    uuid,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted"                boolean,
    "deleted_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "placement_text"         varchar,
    "adsk_row_id"            varchar
);

-- =================================================================
-- # Schema: cdcmeetingminutes
-- =================================================================
--
-- Table: cdcmeetingminutes_assignees
--
DROP TABLE IF EXISTS acc_data_schema.cdcmeetingminutes_assignees;
CREATE TABLE acc_data_schema.cdcmeetingminutes_assignees (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "item_id"                uuid,
    "participant_id"         uuid,
    "non_member_participant_id" uuid,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcmeetingminutes_attachments
--
DROP TABLE IF EXISTS acc_data_schema.cdcmeetingminutes_attachments;
CREATE TABLE acc_data_schema.cdcmeetingminutes_attachments (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "item_id"                uuid,
    "meeting_id"             uuid,
    "uri"                    varchar,
    "origin"                 varchar,
    "name"                   varchar,
    "created_by"             varchar,
    "updated_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcmeetingminutes_items
--
DROP TABLE IF EXISTS acc_data_schema.cdcmeetingminutes_items;
CREATE TABLE acc_data_schema.cdcmeetingminutes_items (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "topic_id"               uuid,
    "order_index"            numeric,
    "description"            varchar,
    "status"                 varchar,
    "cross_series_id"        uuid,
    "due_date"               timestamp without time zone,
    "created_by"             varchar,
    "updated_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcmeetingminutes_meetings
--
DROP TABLE IF EXISTS acc_data_schema.cdcmeetingminutes_meetings;
CREATE TABLE acc_data_schema.cdcmeetingminutes_meetings (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "series_id"              uuid,
    "title"                  varchar,
    "description"            varchar,
    "summary"                varchar,
    "status"                 varchar,
    "num_in_series"          numeric,
    "meeting_location"       varchar,
    "starts_at"              timestamp without time zone,
    "duration"               numeric,
    "video_conference_link"  varchar,
    "created_by"             varchar,
    "updated_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcmeetingminutes_non_member_participants
--
DROP TABLE IF EXISTS acc_data_schema.cdcmeetingminutes_non_member_participants;
CREATE TABLE acc_data_schema.cdcmeetingminutes_non_member_participants (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "meeting_id"             uuid,
    "first_name"             varchar,
    "last_name"              varchar,
    "company"                varchar,
    "email"                  varchar,
    "status"                 varchar,
    "created_by"             varchar,
    "updated_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcmeetingminutes_participants
--
DROP TABLE IF EXISTS acc_data_schema.cdcmeetingminutes_participants;
CREATE TABLE acc_data_schema.cdcmeetingminutes_participants (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "meeting_id"             uuid,
    "autodesk_id"            varchar,
    "type"                   varchar,
    "status"                 varchar,
    "created_by"             varchar,
    "updated_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcmeetingminutes_topics
--
DROP TABLE IF EXISTS acc_data_schema.cdcmeetingminutes_topics;
CREATE TABLE acc_data_schema.cdcmeetingminutes_topics (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "meeting_id"             uuid,
    "order_index"            numeric,
    "name"                   varchar,
    "created_by"             varchar,
    "updated_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

-- =================================================================
-- # Schema: cdcrelationships
-- =================================================================
--
-- Table: cdcrelationships_entity_relationship
--
DROP TABLE IF EXISTS acc_data_schema.cdcrelationships_entity_relationship;
CREATE TABLE acc_data_schema.cdcrelationships_entity_relationship (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "relationship_guid"      uuid,
    "item1_domain"           varchar,
    "item1_entitytype"       varchar,
    "item1_id"               varchar,
    "item2_domain"           varchar,
    "item2_entitytype"       varchar,
    "item2_id"               varchar,
    "created_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "is_deleted"             boolean,
    "is_service_owned"       boolean,
    "updated_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

-- =================================================================
-- # Schema: cdcrfis
-- =================================================================
--
-- Table: cdcrfis_acc_attachments
--
DROP TABLE IF EXISTS acc_data_schema.cdcrfis_acc_attachments;
CREATE TABLE acc_data_schema.cdcrfis_acc_attachments (
    "id"                     uuid,
    "rfi_id"                 uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "entity_id"              uuid,
    "entity_type"            varchar,
    "display_name"           varchar,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "updated_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcrfis_attachments
--
DROP TABLE IF EXISTS acc_data_schema.cdcrfis_attachments;
CREATE TABLE acc_data_schema.cdcrfis_attachments (
    "rfi_id"                 uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "id"                     uuid,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "name"                   varchar,
    "adsk_row_id"            varchar
);

--
-- Table: cdcrfis_category
--
DROP TABLE IF EXISTS acc_data_schema.cdcrfis_category;
CREATE TABLE acc_data_schema.cdcrfis_category (
    "rfi_id"                 uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "category"               varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcrfis_comments
--
DROP TABLE IF EXISTS acc_data_schema.cdcrfis_comments;
CREATE TABLE acc_data_schema.cdcrfis_comments (
    "rfi_id"                 uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "id"                     uuid,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "body"                   varchar,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcrfis_discipline
--
DROP TABLE IF EXISTS acc_data_schema.cdcrfis_discipline;
CREATE TABLE acc_data_schema.cdcrfis_discipline (
    "rfi_id"                 uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "discipline"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcrfis_project_custom_attributes
--
DROP TABLE IF EXISTS acc_data_schema.cdcrfis_project_custom_attributes;
CREATE TABLE acc_data_schema.cdcrfis_project_custom_attributes (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "type"                   varchar,
    "description"            varchar,
    "multiple_choice"        boolean,
    "status"                 varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcrfis_project_custom_attributes_enums
--
DROP TABLE IF EXISTS acc_data_schema.cdcrfis_project_custom_attributes_enums;
CREATE TABLE acc_data_schema.cdcrfis_project_custom_attributes_enums (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "custom_attribute_id"    uuid,
    "name"                   varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcrfis_rfi_assignees
--
DROP TABLE IF EXISTS acc_data_schema.cdcrfis_rfi_assignees;
CREATE TABLE acc_data_schema.cdcrfis_rfi_assignees (
    "id"                     uuid,
    "rfi_id"                 uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "oxygen_id"              varchar,
    "type"                   varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcrfis_rfi_co_reviewers
--
DROP TABLE IF EXISTS acc_data_schema.cdcrfis_rfi_co_reviewers;
CREATE TABLE acc_data_schema.cdcrfis_rfi_co_reviewers (
    "rfi_id"                 uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "user_id"                varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcrfis_rfi_custom_attributes
--
DROP TABLE IF EXISTS acc_data_schema.cdcrfis_rfi_custom_attributes;
CREATE TABLE acc_data_schema.cdcrfis_rfi_custom_attributes (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "rfi_id"                 uuid,
    "custom_attribute_id"    uuid,
    "value_enum_id"          uuid,
    "value_float"            numeric,
    "value_str"              varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcrfis_rfi_distribution_list
--
DROP TABLE IF EXISTS acc_data_schema.cdcrfis_rfi_distribution_list;
CREATE TABLE acc_data_schema.cdcrfis_rfi_distribution_list (
    "rfi_id"                 uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "user_id"                varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcrfis_rfi_location
--
DROP TABLE IF EXISTS acc_data_schema.cdcrfis_rfi_location;
CREATE TABLE acc_data_schema.cdcrfis_rfi_location (
    "rfi_id"                 uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "location"               varchar,
    "location_ids"           varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcrfis_rfi_responses
--
DROP TABLE IF EXISTS acc_data_schema.cdcrfis_rfi_responses;
CREATE TABLE acc_data_schema.cdcrfis_rfi_responses (
    "id"                     uuid,
    "rfi_id"                 uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "content"                varchar,
    "updated_by"             varchar,
    "created_by"             varchar,
    "on_behalf"              varchar,
    "status"                 varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "state"                  varchar,
    "adsk_row_id"            varchar
);

--
-- Table: cdcrfis_rfi_reviewers
--
DROP TABLE IF EXISTS acc_data_schema.cdcrfis_rfi_reviewers;
CREATE TABLE acc_data_schema.cdcrfis_rfi_reviewers (
    "rfi_id"                 uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "user_id"                varchar,
    "type"                   varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcrfis_rfi_transitions
--
DROP TABLE IF EXISTS acc_data_schema.cdcrfis_rfi_transitions;
CREATE TABLE acc_data_schema.cdcrfis_rfi_transitions (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "rfi_id"                 uuid,
    "from_status"            varchar,
    "to_status"              varchar,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcrfis_rfi_types
--
DROP TABLE IF EXISTS acc_data_schema.cdcrfis_rfi_types;
CREATE TABLE acc_data_schema.cdcrfis_rfi_types (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "wf_type"                varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcrfis_rfis
--
DROP TABLE IF EXISTS acc_data_schema.cdcrfis_rfis;
CREATE TABLE acc_data_schema.cdcrfis_rfis (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "custom_identifier"      varchar,
    "title"                  varchar,
    "question"               varchar,
    "status"                 varchar,
    "due_date"               timestamp without time zone,
    "linked_document"        varchar,
    "linked_document_version" numeric,
    "linked_document_close_version" numeric,
    "official_response"      varchar,
    "official_response_status" varchar,
    "responded_at"           timestamp without time zone,
    "responded_by"           varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "closed_by"              varchar,
    "closed_at"              timestamp without time zone,
    "suggested_answer"       varchar,
    "manager_id"             varchar,
    "answered_at"            timestamp without time zone,
    "answered_by"            varchar,
    "cost_impact"            varchar,
    "schedule_impact"        varchar,
    "priority"               varchar,
    "reference"              varchar,
    "opened_at"              timestamp without time zone,
    "location_id"            varchar,
    "rfi_type"               uuid,
    "bridged_source"         boolean,
    "bridged_target"         boolean,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

-- =================================================================
-- # Schema: cdcschedule
-- =================================================================
--
-- Table: cdcschedule_activities
--
DROP TABLE IF EXISTS acc_data_schema.cdcschedule_activities;
CREATE TABLE acc_data_schema.cdcschedule_activities (
    "id"                     uuid,
    "schedule_id"            uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "unique_id"              numeric,
    "sequential_id"          numeric,
    "file_activity_id"       varchar,
    "parent_unique_id"       numeric,
    "type"                   varchar,
    "name"                   varchar,
    "is_critical_path"       boolean,
    "completion_percentage"  numeric,
    "planned_start"          timestamp without time zone,
    "planned_finish"         timestamp without time zone,
    "actual_start"           timestamp without time zone,
    "actual_finish"          timestamp without time zone,
    "start"                  timestamp without time zone,
    "finish"                 timestamp without time zone,
    "duration"               numeric,
    "actual_duration"        numeric,
    "remaining_duration"     numeric,
    "free_slack_units"       varchar,
    "free_slack_duration"    numeric,
    "total_slack_units"      varchar,
    "total_slack_duration"   numeric,
    "is_wbs"                 boolean,
    "wbs_path"               varchar,
    "wbs_code"               varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "wbs_path_text"          varchar,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcschedule_activity_codes
--
DROP TABLE IF EXISTS acc_data_schema.cdcschedule_activity_codes;
CREATE TABLE acc_data_schema.cdcschedule_activity_codes (
    "id"                     uuid,
    "schedule_id"            uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_unique_id"     numeric,
    "name"                   varchar,
    "value"                  varchar,
    "value_description"      varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcschedule_comments
--
DROP TABLE IF EXISTS acc_data_schema.cdcschedule_comments;
CREATE TABLE acc_data_schema.cdcschedule_comments (
    "id"                     uuid,
    "schedule_id"            uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_unique_id"     numeric,
    "body"                   varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcschedule_dependencies
--
DROP TABLE IF EXISTS acc_data_schema.cdcschedule_dependencies;
CREATE TABLE acc_data_schema.cdcschedule_dependencies (
    "id"                     uuid,
    "schedule_id"            uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "source_unique_id"       numeric,
    "target_unique_id"       numeric,
    "type"                   varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcschedule_plan_commitments
--
DROP TABLE IF EXISTS acc_data_schema.cdcschedule_plan_commitments;
CREATE TABLE acc_data_schema.cdcschedule_plan_commitments (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "plan_id"                uuid,
    "task_id"                uuid,
    "replanned_commitment_id" uuid,
    "root_cause_id"          uuid,
    "task_type"              varchar,
    "work_type"              varchar,
    "status"                 varchar,
    "start_date"             date,
    "finish_date"            date,
    "duration"               numeric,
    "assigned_member_id"     varchar,
    "assigned_company_id"    varchar,
    "assigned_role_id"       varchar,
    "location_id"            uuid,
    "wbs_id"                 uuid,
    "crew_size"              numeric,
    "was_start_changed"      boolean,
    "was_duration_changed"   boolean,
    "was_finish_changed"     boolean,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcschedule_plan_handoffs
--
DROP TABLE IF EXISTS acc_data_schema.cdcschedule_plan_handoffs;
CREATE TABLE acc_data_schema.cdcschedule_plan_handoffs (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "plan_id"                uuid,
    "source_task"            uuid,
    "target_task"            uuid,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcschedule_plan_plans
--
DROP TABLE IF EXISTS acc_data_schema.cdcschedule_plan_plans;
CREATE TABLE acc_data_schema.cdcschedule_plan_plans (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "schedule_id"            uuid,
    "created_by"             varchar,
    "updated_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcschedule_plan_project_settings
--
DROP TABLE IF EXISTS acc_data_schema.cdcschedule_plan_project_settings;
CREATE TABLE acc_data_schema.cdcschedule_plan_project_settings (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "non_working_dates"      varchar,
    "first_day_of_the_week"  varchar,
    "working_days"           varchar,
    "wbs_tree"               varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcschedule_plan_task_comments
--
DROP TABLE IF EXISTS acc_data_schema.cdcschedule_plan_task_comments;
CREATE TABLE acc_data_schema.cdcschedule_plan_task_comments (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "task_id"                uuid,
    "plan_id"                uuid,
    "body"                   varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "created_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcschedule_plan_tasks
--
DROP TABLE IF EXISTS acc_data_schema.cdcschedule_plan_tasks;
CREATE TABLE acc_data_schema.cdcschedule_plan_tasks (
    "id"                     uuid,
    "plan_id"                uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "parent_task_id"         uuid,
    "activity_unique_id"     numeric,
    "unique_id"              numeric,
    "task_type"              varchar,
    "work_type"              varchar,
    "status"                 varchar,
    "title"                  varchar,
    "description"            varchar,
    "start_date"             date,
    "finish_date"            date,
    "duration"               numeric,
    "location_id"            uuid,
    "assigned_member_id"     varchar,
    "assigned_company_id"    varchar,
    "assigned_role_id"       varchar,
    "wbs_id"                 uuid,
    "completion_percentage"  numeric,
    "crew_size"              numeric,
    "priority"               numeric,
    "comments_count"         numeric,
    "commitments_count"      numeric,
    "task_imports_id"        varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "archived_at"            timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcschedule_resources
--
DROP TABLE IF EXISTS acc_data_schema.cdcschedule_resources;
CREATE TABLE acc_data_schema.cdcschedule_resources (
    "id"                     uuid,
    "schedule_id"            uuid,
    "resource_unique_id"     numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_unique_id"     numeric,
    "name"                   varchar,
    "type"                   varchar,
    "email_address"          varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcschedule_schedules
--
DROP TABLE IF EXISTS acc_data_schema.cdcschedule_schedules;
CREATE TABLE acc_data_schema.cdcschedule_schedules (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "type"                   varchar,
    "version_number"         numeric,
    "is_public"              boolean,
    "created_by"             varchar,
    "updated_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

-- =================================================================
-- # Schema: cdcsheets
-- =================================================================
--
-- Table: cdcsheets_disciplines
--
DROP TABLE IF EXISTS acc_data_schema.cdcsheets_disciplines;
CREATE TABLE acc_data_schema.cdcsheets_disciplines (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "container_type"         varchar,
    "index"                  numeric,
    "name"                   varchar,
    "designator"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcsheets_lineages
--
DROP TABLE IF EXISTS acc_data_schema.cdcsheets_lineages;
CREATE TABLE acc_data_schema.cdcsheets_lineages (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "container_type"         varchar,
    "name"                   varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcsheets_sets
--
DROP TABLE IF EXISTS acc_data_schema.cdcsheets_sets;
CREATE TABLE acc_data_schema.cdcsheets_sets (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "container_type"         varchar,
    "name"                   varchar,
    "issuance_date"          timestamp without time zone,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "created_by_name"        varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_by_name"        varchar,
    "deleted"                boolean,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcsheets_sheet_bubbles
--
DROP TABLE IF EXISTS acc_data_schema.cdcsheets_sheet_bubbles;
CREATE TABLE acc_data_schema.cdcsheets_sheet_bubbles (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "container_type"         varchar,
    "sheet_id"               uuid,
    "urn"                    varchar,
    "viewable_guid"          varchar,
    "paper_width"            numeric,
    "paper_height"           numeric,
    "viewable_order"         numeric,
    "pug_urn"                varchar,
    "pug_width"              numeric,
    "pug_height"             numeric,
    "large_thumbnail_width"  numeric,
    "large_thumbnail_height" numeric,
    "small_thumbnail_width"  numeric,
    "small_thumbnail_height" numeric,
    "storage_urn"            varchar,
    "storage_size"           numeric,
    "viewable_urn"           varchar,
    "viewable_width"         numeric,
    "viewable_height"        numeric,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcsheets_sheet_tags
--
DROP TABLE IF EXISTS acc_data_schema.cdcsheets_sheet_tags;
CREATE TABLE acc_data_schema.cdcsheets_sheet_tags (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "container_type"         varchar,
    "sheet_id"               uuid,
    "value"                  varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcsheets_sheets
--
DROP TABLE IF EXISTS acc_data_schema.cdcsheets_sheets;
CREATE TABLE acc_data_schema.cdcsheets_sheets (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "container_type"         varchar,
    "name"                   varchar,
    "nat_sort_name"          varchar,
    "history_id"             uuid,
    "version_set_id"         uuid,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "created_by_name"        varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_by_name"        varchar,
    "title"                  varchar,
    "upload_file_name"       varchar,
    "upload_id"              uuid,
    "processing_state"       varchar,
    "is_current"             boolean,
    "discipline_index"       numeric,
    "deleted"                boolean,
    "deleted_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "deleted_by_name"        varchar,
    "original_set_name"      varchar,
    "adsk_row_id"            varchar
);

-- =================================================================
-- # Schema: cdcsubmittalsacc
-- =================================================================
--
-- Table: cdcsubmittalsacc_attachments
--
DROP TABLE IF EXISTS acc_data_schema.cdcsubmittalsacc_attachments;
CREATE TABLE acc_data_schema.cdcsubmittalsacc_attachments (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "item_id"                uuid,
    "name"                   varchar,
    "revision"               numeric,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "upload_urn"             varchar,
    "category_id"            varchar,
    "category_value"         varchar,
    "task_id"                uuid,
    "is_file_uploaded"       boolean,
    "urn"                    varchar,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcsubmittalsacc_comments
--
DROP TABLE IF EXISTS acc_data_schema.cdcsubmittalsacc_comments;
CREATE TABLE acc_data_schema.cdcsubmittalsacc_comments (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "item_id"                uuid,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "body"                   varchar,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcsubmittalsacc_custom_identifier_settings
--
DROP TABLE IF EXISTS acc_data_schema.cdcsubmittalsacc_custom_identifier_settings;
CREATE TABLE acc_data_schema.cdcsubmittalsacc_custom_identifier_settings (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "can_switch_type"        boolean,
    "sequence_type"          varchar,
    "created_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcsubmittalsacc_item_custom_attribute_value
--
DROP TABLE IF EXISTS acc_data_schema.cdcsubmittalsacc_item_custom_attribute_value;
CREATE TABLE acc_data_schema.cdcsubmittalsacc_item_custom_attribute_value (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "item_id"                uuid,
    "parameter_id"           uuid,
    "parameter_name"         varchar,
    "parameter_type"         varchar,
    "value"                  varchar,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "select_value"           varchar,
    "adsk_row_id"            varchar
);

--
-- Table: cdcsubmittalsacc_item_revision
--
DROP TABLE IF EXISTS acc_data_schema.cdcsubmittalsacc_item_revision;
CREATE TABLE acc_data_schema.cdcsubmittalsacc_item_revision (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "id"                     uuid,
    "item_id"                uuid,
    "manager"                varchar,
    "manager_type"           varchar,
    "subcontractor"          varchar,
    "subcontractor_type"     varchar,
    "revision"               numeric,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "sent_to_submitter"      timestamp without time zone,
    "submitter_due_date"     date,
    "received_from_submitter" timestamp without time zone,
    "submitted_by"           varchar,
    "sent_to_review"         timestamp without time zone,
    "manager_due_date"       date,
    "sent_to_review_by"      varchar,
    "received_from_review"   timestamp without time zone,
    "response_id"            varchar,
    "response_comment"       varchar,
    "responded_at"           timestamp without time zone,
    "responded_by"           varchar,
    "published_date"         timestamp without time zone,
    "published_by"           varchar,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcsubmittalsacc_item_watchers
--
DROP TABLE IF EXISTS acc_data_schema.cdcsubmittalsacc_item_watchers;
CREATE TABLE acc_data_schema.cdcsubmittalsacc_item_watchers (
    "item_id"                uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "user_id"                varchar,
    "user_type_id"           varchar,
    "user_type_value"        varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcsubmittalsacc_items
--
DROP TABLE IF EXISTS acc_data_schema.cdcsubmittalsacc_items;
CREATE TABLE acc_data_schema.cdcsubmittalsacc_items (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "spec_id"                uuid,
    "spec_identifier"        varchar,
    "title"                  varchar,
    "type_id"                varchar,
    "type_value"             varchar,
    "response_comment"       varchar,
    "ball_in_court"          varchar,
    "revision"               numeric,
    "responded_by"           varchar,
    "description"            varchar,
    "responded_at"           timestamp without time zone,
    "due_date"               date,
    "required_on_job_date"   date,
    "manager"                varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "state_id"               varchar,
    "response_id"            varchar,
    "response_value"         varchar,
    "subsection"             varchar,
    "subcontractor"          varchar,
    "identifier"             numeric,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "status_id"              varchar,
    "status_value"           varchar,
    "package_title"          varchar,
    "package"                uuid,
    "package_identifier"     numeric,
    "priority_id"            numeric,
    "priority_value"         varchar,
    "required_date"          date,
    "required_approval_date" date,
    "lead_time"              numeric,
    "sent_to_submitter"      timestamp without time zone,
    "received_from_submitter" timestamp without time zone,
    "submitted_by"           varchar,
    "sent_to_review"         timestamp without time zone,
    "sent_to_review_by"      varchar,
    "received_from_review"   timestamp without time zone,
    "published_date"         timestamp without time zone,
    "published_by"           varchar,
    "submitter_due_date"     date,
    "manager_due_date"       date,
    "ball_in_court_users"    varchar,
    "ball_in_court_roles"    varchar,
    "ball_in_court_companies" varchar,
    "manager_type"           varchar,
    "subcontractor_type"     varchar,
    "custom_identifier"      varchar,
    "custom_identifier_sort" varchar,
    "custom_identifier_human_readable" varchar,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar,
    "pending_actions_from"   varchar
);

--
-- Table: cdcsubmittalsacc_itemtype
--
DROP TABLE IF EXISTS acc_data_schema.cdcsubmittalsacc_itemtype;
CREATE TABLE acc_data_schema.cdcsubmittalsacc_itemtype (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "created_by"             varchar,
    "value"                  varchar,
    "platform_id"            varchar,
    "is_active"              boolean,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcsubmittalsacc_packages
--
DROP TABLE IF EXISTS acc_data_schema.cdcsubmittalsacc_packages;
CREATE TABLE acc_data_schema.cdcsubmittalsacc_packages (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "spec_id"                uuid,
    "title"                  varchar,
    "identifier"             numeric,
    "description"            varchar,
    "updated_by"             varchar,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "spec_identifier"        varchar,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcsubmittalsacc_parameters_collections
--
DROP TABLE IF EXISTS acc_data_schema.cdcsubmittalsacc_parameters_collections;
CREATE TABLE acc_data_schema.cdcsubmittalsacc_parameters_collections (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "parameter_id"           uuid,
    "parameter_external_id"  varchar,
    "parameter_name"         varchar,
    "parameter_description"  varchar,
    "parameter_type"         varchar,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "parameter_select_options" varchar,
    "adsk_row_id"            varchar
);

--
-- Table: cdcsubmittalsacc_specs
--
DROP TABLE IF EXISTS acc_data_schema.cdcsubmittalsacc_specs;
CREATE TABLE acc_data_schema.cdcsubmittalsacc_specs (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "id"                     uuid,
    "identifier"             varchar,
    "title"                  varchar,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcsubmittalsacc_steps
--
DROP TABLE IF EXISTS acc_data_schema.cdcsubmittalsacc_steps;
CREATE TABLE acc_data_schema.cdcsubmittalsacc_steps (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "status"                 varchar,
    "step_number"            numeric,
    "days_to_respond"        numeric,
    "due_date"               date,
    "started_at"             timestamp without time zone,
    "completed_at"           timestamp without time zone,
    "item_id"                uuid,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdcsubmittalsacc_tasks
--
DROP TABLE IF EXISTS acc_data_schema.cdcsubmittalsacc_tasks;
CREATE TABLE acc_data_schema.cdcsubmittalsacc_tasks (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "status"                 varchar,
    "assigned_to"            varchar,
    "is_required"            boolean,
    "response_comment"       varchar,
    "responded_at"           timestamp without time zone,
    "responded_by"           varchar,
    "started_at"             timestamp without time zone,
    "completed_at"           timestamp without time zone,
    "completed_by"           varchar,
    "response_value"         varchar,
    "response_id"            uuid,
    "step_id"                uuid,
    "assigned_to_type"       varchar,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

-- =================================================================
-- # Schema: cdctransmittals
-- =================================================================
--
-- Table: cdctransmittals_transmittal_documents
--
DROP TABLE IF EXISTS acc_data_schema.cdctransmittals_transmittal_documents;
CREATE TABLE acc_data_schema.cdctransmittals_transmittal_documents (
    "id"                     uuid,
    "workflow_transmittal_id" uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "urn"                    varchar,
    "file_name"              varchar,
    "version_number"         numeric,
    "revision_number"        numeric,
    "parent_folder_urn"      varchar,
    "last_modified_time"     timestamp without time zone,
    "last_modified_user_id"  varchar,
    "last_modified_user_name" varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdctransmittals_transmittal_non_members
--
DROP TABLE IF EXISTS acc_data_schema.cdctransmittals_transmittal_non_members;
CREATE TABLE acc_data_schema.cdctransmittals_transmittal_non_members (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "email"                  varchar,
    "first_name"             varchar,
    "last_name"              varchar,
    "company_name"           varchar,
    "role"                   varchar,
    "workflow_transmittal_id" uuid,
    "viewed_at"              timestamp without time zone,
    "downloaded_at"          timestamp without time zone,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdctransmittals_transmittal_recipients
--
DROP TABLE IF EXISTS acc_data_schema.cdctransmittals_transmittal_recipients;
CREATE TABLE acc_data_schema.cdctransmittals_transmittal_recipients (
    "id"                     uuid,
    "workflow_transmittal_id" uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "user_id"                uuid,
    "user_name"              varchar,
    "email"                  varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "company_name"           varchar,
    "viewed_at"              timestamp without time zone,
    "downloaded_at"          timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

--
-- Table: cdctransmittals_workflow_transmittals
--
DROP TABLE IF EXISTS acc_data_schema.cdctransmittals_workflow_transmittals;
CREATE TABLE acc_data_schema.cdctransmittals_workflow_transmittals (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "sequence_id"            numeric,
    "title"                  varchar,
    "status"                 numeric,
    "create_user_id"         uuid,
    "create_user_name"       varchar,
    "docs_count"             numeric,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "create_user_company_id" varchar,
    "create_user_company_name" varchar,
    "deleted_at"             timestamp without time zone,
    "adsk_row_id"            varchar
);

-- =================================================================
-- # Schema: checklists
-- =================================================================
--
-- Table: checklists_checklist_assignees
--
DROP TABLE IF EXISTS acc_data_schema.checklists_checklist_assignees;
CREATE TABLE acc_data_schema.checklists_checklist_assignees (
    "instance_id"            numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "id"                     numeric,
    "assignee_id"            varchar,
    "name"                   varchar,
    "assignee_type"          varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "is_previous_assignee"   boolean
);

--
-- Table: checklists_checklist_attachments
--
DROP TABLE IF EXISTS acc_data_schema.checklists_checklist_attachments;
CREATE TABLE acc_data_schema.checklists_checklist_attachments (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "lineage_urn"            varchar,
    "version"                numeric,
    "instance_id"            numeric
);

--
-- Table: checklists_checklist_item_doc_attachments
--
DROP TABLE IF EXISTS acc_data_schema.checklists_checklist_item_doc_attachments;
CREATE TABLE acc_data_schema.checklists_checklist_item_doc_attachments (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "lineage_urn"            varchar,
    "item_id"                numeric,
    "section_id"             numeric,
    "instance_id"            numeric
);

--
-- Table: checklists_checklist_items
--
DROP TABLE IF EXISTS acc_data_schema.checklists_checklist_items;
CREATE TABLE acc_data_schema.checklists_checklist_items (
    "id"                     numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "instance_section_id"    numeric,
    "template_item_id"       numeric,
    "modified_by"            varchar,
    "is_required"            boolean,
    "note"                   varchar,
    "title"                  varchar,
    "answers"                varchar,
    "instance_id"            numeric,
    "answer_type"            numeric,
    "answers_v2"             varchar
);

--
-- Table: checklists_checklist_items_answers
--
DROP TABLE IF EXISTS acc_data_schema.checklists_checklist_items_answers;
CREATE TABLE acc_data_schema.checklists_checklist_items_answers (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "answer"                 varchar,
    "item_version_id"        numeric
);

--
-- Table: checklists_checklist_section_assignees
--
DROP TABLE IF EXISTS acc_data_schema.checklists_checklist_section_assignees;
CREATE TABLE acc_data_schema.checklists_checklist_section_assignees (
    "id"                     numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "instance_id"            numeric,
    "instance_section_id"    numeric,
    "id2"                    numeric,
    "assignee_id"            varchar,
    "assignee_type"          varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "is_previous_section_assignee" boolean
);

--
-- Table: checklists_checklist_sections
--
DROP TABLE IF EXISTS acc_data_schema.checklists_checklist_sections;
CREATE TABLE acc_data_schema.checklists_checklist_sections (
    "id"                     numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "instance_id"            numeric,
    "template_section_id"    numeric,
    "modified_by"            varchar,
    "status"                 varchar
);

--
-- Table: checklists_checklist_sections_signatures
--
DROP TABLE IF EXISTS acc_data_schema.checklists_checklist_sections_signatures;
CREATE TABLE acc_data_schema.checklists_checklist_sections_signatures (
    "id"                     uuid,
    "instance_section_id"    numeric,
    "instance_id"            numeric,
    "required_by"            varchar,
    "is_required"            boolean,
    "instructions"           varchar,
    "signed_name"            varchar,
    "signed_company"         varchar,
    "submitted_by"           varchar,
    "signed_at"              timestamp without time zone,
    "created_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "urn"                    varchar,
    "oss_urn"                varchar,
    "upload_status"          varchar,
    "bim360_project_id"      uuid,
    "bim360_account_id"      uuid
);

--
-- Table: checklists_checklist_signatures
--
DROP TABLE IF EXISTS acc_data_schema.checklists_checklist_signatures;
CREATE TABLE acc_data_schema.checklists_checklist_signatures (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "instance_id"            numeric,
    "required_by"            varchar,
    "is_required"            boolean,
    "defined_at"             varchar,
    "required_name"          varchar,
    "required_company"       varchar,
    "signed_name"            varchar,
    "signed_company"         varchar,
    "submitted_by"           varchar,
    "signed_at"              timestamp without time zone,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "type"                   varchar,
    "is_signed"              boolean
);

--
-- Table: checklists_checklists
--
DROP TABLE IF EXISTS acc_data_schema.checklists_checklists;
CREATE TABLE acc_data_schema.checklists_checklists (
    "id"                     numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "scheduled_date"         timestamp without time zone,
    "location"               varchar,
    "title"                  varchar,
    "template_id"            numeric,
    "template_version_id"    numeric,
    "created_by"             varchar,
    "modified_by"            varchar,
    "updated_at"             timestamp without time zone,
    "created_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "instructions"           varchar,
    "template_type"          varchar,
    "status"                 varchar,
    "progress"               numeric,
    "completed_items_count"  numeric,
    "items_count"            numeric,
    "sections_count"         numeric,
    "created_by_company"     varchar,
    "required_signatures_count" numeric,
    "unsigned_signatures_count" numeric,
    "allow_section_assignee" boolean,
    "checklist_id"           numeric,
    "completed_on"           timestamp without time zone,
    "started_on"             timestamp without time zone,
    "is_archived"            boolean,
    "archived_on"            timestamp without time zone,
    "archived_by"            varchar
);

--
-- Table: checklists_template_item_instructions
--
DROP TABLE IF EXISTS acc_data_schema.checklists_template_item_instructions;
CREATE TABLE acc_data_schema.checklists_template_item_instructions (
    "template_id"            numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "template_version_id"    numeric,
    "section_id"             numeric,
    "item_id"                numeric,
    "item_version_id"        numeric,
    "id"                     numeric,
    "instructions_type"      varchar,
    "data"                   varchar,
    "updated_at"             timestamp without time zone,
    "created_at"             timestamp without time zone
);

--
-- Table: checklists_template_items
--
DROP TABLE IF EXISTS acc_data_schema.checklists_template_items;
CREATE TABLE acc_data_schema.checklists_template_items (
    "template_version_id"    numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "template_id"            numeric,
    "template_section_id"    numeric,
    "item_id"                numeric,
    "item_version_id"        numeric,
    "number"                 numeric,
    "index"                  numeric,
    "is_required"            boolean,
    "title"                  varchar,
    "section_id"             numeric,
    "updated_at"             timestamp without time zone,
    "created_at"             timestamp without time zone,
    "response_type"          varchar,
    "possible_answers"       varchar
);

--
-- Table: checklists_template_items_all
--
DROP TABLE IF EXISTS acc_data_schema.checklists_template_items_all;
CREATE TABLE acc_data_schema.checklists_template_items_all (
    "template_version_id"    numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "template_id"            numeric,
    "template_section_id"    numeric,
    "item_id"                numeric,
    "item_version_id"        numeric,
    "number"                 numeric,
    "index"                  numeric,
    "is_required"            boolean,
    "title"                  varchar,
    "section_id"             numeric,
    "updated_at"             timestamp without time zone,
    "created_at"             timestamp without time zone,
    "response_type"          varchar,
    "possible_answers"       varchar
);

--
-- Table: checklists_template_items_answers
--
DROP TABLE IF EXISTS acc_data_schema.checklists_template_items_answers;
CREATE TABLE acc_data_schema.checklists_template_items_answers (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "list_response_id"       uuid,
    "possible_answers"       varchar
);

--
-- Table: checklists_template_sections
--
DROP TABLE IF EXISTS acc_data_schema.checklists_template_sections;
CREATE TABLE acc_data_schema.checklists_template_sections (
    "id"                     numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "template_id"            numeric,
    "template_version_id"    numeric,
    "title"                  varchar,
    "number"                 numeric,
    "index"                  numeric,
    "instructions"           varchar,
    "updated_at"             timestamp without time zone,
    "created_at"             timestamp without time zone
);

--
-- Table: checklists_template_sections_all
--
DROP TABLE IF EXISTS acc_data_schema.checklists_template_sections_all;
CREATE TABLE acc_data_schema.checklists_template_sections_all (
    "id"                     numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "template_id"            numeric,
    "template_version_id"    numeric,
    "title"                  varchar,
    "number"                 numeric,
    "index"                  numeric,
    "instructions"           varchar,
    "updated_at"             timestamp without time zone,
    "created_at"             timestamp without time zone
);

--
-- Table: checklists_template_signatures
--
DROP TABLE IF EXISTS acc_data_schema.checklists_template_signatures;
CREATE TABLE acc_data_schema.checklists_template_signatures (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "template_version_id"    numeric,
    "template_id"            numeric,
    "required_by"            varchar,
    "is_required"            boolean,
    "updated_at"             timestamp without time zone,
    "created_at"             timestamp without time zone
);

--
-- Table: checklists_template_signatures_all
--
DROP TABLE IF EXISTS acc_data_schema.checklists_template_signatures_all;
CREATE TABLE acc_data_schema.checklists_template_signatures_all (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "template_version_id"    numeric,
    "template_id"            numeric,
    "required_by"            varchar,
    "is_required"            boolean,
    "updated_at"             timestamp without time zone,
    "created_at"             timestamp without time zone
);

--
-- Table: checklists_templates
--
DROP TABLE IF EXISTS acc_data_schema.checklists_templates;
CREATE TABLE acc_data_schema.checklists_templates (
    "template_id"            numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "title"                  varchar,
    "template_version_id"    numeric,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "created_at"             timestamp without time zone,
    "instructions"           varchar,
    "template_type"          varchar,
    "allow_section_assignee" boolean,
    "items_count"            numeric,
    "sections_count"         numeric,
    "modified_by"            varchar,
    "version_number"         numeric,
    "share_status"           varchar,
    "deleted_at"             timestamp without time zone
);

--
-- Table: checklists_templates_versions
--
DROP TABLE IF EXISTS acc_data_schema.checklists_templates_versions;
CREATE TABLE acc_data_schema.checklists_templates_versions (
    "template_id"            numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "title"                  varchar,
    "template_version_id"    numeric,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "created_at"             timestamp without time zone,
    "instructions"           varchar,
    "template_type"          varchar,
    "allow_section_assignee" boolean,
    "items_count"            numeric,
    "sections_count"         numeric,
    "modified_by"            varchar,
    "version_number"         numeric,
    "share_status"           varchar,
    "deleted_at"             timestamp without time zone
);

-- =================================================================
-- # Schema: clashes
-- =================================================================
--
-- Table: clashes_assigned_clash_group
--
DROP TABLE IF EXISTS acc_data_schema.clashes_assigned_clash_group;
CREATE TABLE acc_data_schema.clashes_assigned_clash_group (
    "clash_group_id"         uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "issue_id"               uuid,
    "title"                  varchar,
    "description"            varchar,
    "status"                 varchar,
    "clash_test_id"          uuid,
    "model_set_id"           uuid,
    "created_at_model_set_version" numeric,
    "created_at"             timestamp without time zone,
    "created_by"             varchar
);

--
-- Table: clashes_clash_group_to_clash_id
--
DROP TABLE IF EXISTS acc_data_schema.clashes_clash_group_to_clash_id;
CREATE TABLE acc_data_schema.clashes_clash_group_to_clash_id (
    "clash_group_id"         uuid,
    "clash_id"               numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid
);

--
-- Table: clashes_clash_test
--
DROP TABLE IF EXISTS acc_data_schema.clashes_clash_test;
CREATE TABLE acc_data_schema.clashes_clash_test (
    "clash_test_id"          uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "model_set_id"           uuid,
    "model_set_version"      numeric,
    "root_folder_urn"        varchar,
    "started_at"             timestamp without time zone,
    "completed_at"           timestamp without time zone,
    "status"                 varchar,
    "backend_type"           numeric
);

--
-- Table: clashes_closed_clash_group
--
DROP TABLE IF EXISTS acc_data_schema.clashes_closed_clash_group;
CREATE TABLE acc_data_schema.clashes_closed_clash_group (
    "clash_group_id"         uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "reason"                 varchar,
    "title"                  varchar,
    "description"            varchar,
    "clash_test_id"          uuid,
    "model_set_id"           uuid,
    "created_at_model_set_version" numeric,
    "created_at"             timestamp without time zone,
    "created_by"             varchar
);

-- =================================================================
-- # Schema: classifications
-- =================================================================
--
-- Table: classifications_nodes_account
--
DROP TABLE IF EXISTS acc_data_schema.classifications_nodes_account;
CREATE TABLE acc_data_schema.classifications_nodes_account (
    "structure_id"           uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "structure_name"         varchar,
    "parent_node_id"         numeric,
    "node_id"                numeric,
    "node_code"              varchar,
    "node_name"              varchar,
    "order"                  numeric,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: classifications_nodes_library_used_in_project
--
DROP TABLE IF EXISTS acc_data_schema.classifications_nodes_library_used_in_project;
CREATE TABLE acc_data_schema.classifications_nodes_library_used_in_project (
    "structure_id"           uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "structure_name"         varchar,
    "parent_node_id"         numeric,
    "node_id"                numeric,
    "node_code"              varchar,
    "node_name"              varchar,
    "order"                  numeric,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: classifications_nodes_project
--
DROP TABLE IF EXISTS acc_data_schema.classifications_nodes_project;
CREATE TABLE acc_data_schema.classifications_nodes_project (
    "structure_id"           uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "structure_name"         varchar,
    "parent_node_id"         numeric,
    "node_id"                numeric,
    "node_code"              varchar,
    "node_name"              varchar,
    "order"                  numeric,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: classifications_structures_account
--
DROP TABLE IF EXISTS acc_data_schema.classifications_structures_account;
CREATE TABLE acc_data_schema.classifications_structures_account (
    "structure_id"           uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "structure_name"         varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: classifications_structures_project
--
DROP TABLE IF EXISTS acc_data_schema.classifications_structures_project;
CREATE TABLE acc_data_schema.classifications_structures_project (
    "structure_id"           uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "structure_name"         varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

-- =================================================================
-- # Schema: cost
-- =================================================================
--
-- Table: cost_approval_workflows
--
DROP TABLE IF EXISTS acc_data_schema.cost_approval_workflows;
CREATE TABLE acc_data_schema.cost_approval_workflows (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "association_id"         uuid,
    "association_type"       varchar,
    "current_step_name"      varchar,
    "current_assigned_users" varchar,
    "current_assigned_groups" varchar,
    "reviewed_users"         varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "current_due_date"       timestamp without time zone
);

--
-- Table: cost_budget_code_segment_codes
--
DROP TABLE IF EXISTS acc_data_schema.cost_budget_code_segment_codes;
CREATE TABLE acc_data_schema.cost_budget_code_segment_codes (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "parent_id"              uuid,
    "segment_id"             uuid,
    "code"                   varchar,
    "original_code"          varchar,
    "description"            varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: cost_budget_code_segments
--
DROP TABLE IF EXISTS acc_data_schema.cost_budget_code_segments;
CREATE TABLE acc_data_schema.cost_budget_code_segments (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "length"                 numeric,
    "position"               numeric,
    "type"                   varchar,
    "delimiter"              varchar,
    "sample_code"            varchar,
    "is_variable_length"     boolean,
    "is_locked"              boolean,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: cost_budget_payment_items
--
DROP TABLE IF EXISTS acc_data_schema.cost_budget_payment_items;
CREATE TABLE acc_data_schema.cost_budget_payment_items (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "payment_id"             uuid,
    "parent_id"              uuid,
    "number"                 varchar,
    "name"                   varchar,
    "description"            varchar,
    "unit"                   varchar,
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
    "status"                 varchar,
    "creator_id"             varchar,
    "changed_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: cost_budget_payment_properties
--
DROP TABLE IF EXISTS acc_data_schema.cost_budget_payment_properties;
CREATE TABLE acc_data_schema.cost_budget_payment_properties (
    "budget_payment_id"      uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "built_in"               boolean,
    "position"               numeric,
    "property_definition_id" uuid,
    "type"                   varchar,
    "value"                  varchar
);

--
-- Table: cost_budget_payments
--
DROP TABLE IF EXISTS acc_data_schema.cost_budget_payments;
CREATE TABLE acc_data_schema.cost_budget_payments (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "main_contract_id"       uuid,
    "start_date"             timestamp without time zone,
    "end_date"               timestamp without time zone,
    "due_date"               timestamp without time zone,
    "number"                 varchar,
    "name"                   varchar,
    "description"            varchar,
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
    "status"                 varchar,
    "company_id"             varchar,
    "payment_type"           varchar,
    "payment_reference"      varchar,
    "creator_id"             varchar,
    "changed_by"             varchar,
    "contact_id"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "approved_at"            timestamp without time zone,
    "paid_at"                timestamp without time zone,
    "submitted_at"           timestamp without time zone,
    "note"                   varchar,
    "materials_billed"       numeric,
    "materials_retention"    numeric,
    "integration_state"      varchar,
    "integration_state_changed_by" varchar,
    "integration_state_changed_at" timestamp without time zone,
    "external_id"            varchar,
    "external_system"        varchar,
    "message"                varchar,
    "last_sync_time"         timestamp without time zone
);

--
-- Table: cost_budget_properties
--
DROP TABLE IF EXISTS acc_data_schema.cost_budget_properties;
CREATE TABLE acc_data_schema.cost_budget_properties (
    "budget_id"              uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "built_in"               boolean,
    "position"               numeric,
    "property_definition_id" uuid,
    "type"                   varchar,
    "value"                  varchar
);

--
-- Table: cost_budget_transfers
--
DROP TABLE IF EXISTS acc_data_schema.cost_budget_transfers;
CREATE TABLE acc_data_schema.cost_budget_transfers (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "number"                 varchar,
    "name"                   varchar,
    "note"                   varchar,
    "status"                 varchar,
    "approved_at"            timestamp without time zone,
    "creator_id"             varchar,
    "changed_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "integration_state"      varchar,
    "integration_state_changed_by" varchar,
    "integration_state_changed_at" timestamp without time zone,
    "external_id"            varchar,
    "external_system"        varchar,
    "message"                varchar,
    "last_sync_time"         timestamp without time zone
);

--
-- Table: cost_budgets
--
DROP TABLE IF EXISTS acc_data_schema.cost_budgets;
CREATE TABLE acc_data_schema.cost_budgets (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "parent_id"              uuid,
    "code"                   varchar,
    "name"                   varchar,
    "description"            varchar,
    "quantity"               numeric,
    "unit_price"             numeric,
    "unit"                   varchar,
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
    "main_contract_id"       uuid,
    "contract_id"            uuid,
    "adjustments_total"      numeric,
    "uncommitted"            numeric,
    "revised"                numeric,
    "projected_cost"         numeric,
    "projected_budget"       numeric,
    "forecast_final_cost"    numeric,
    "forecast_variance"      numeric,
    "forecast_cost_complete" numeric,
    "variance_total"         numeric,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "original_contracted"    numeric,
    "compounded"             varchar,
    "integration_state"      varchar,
    "integration_state_changed_by" varchar,
    "integration_state_changed_at" timestamp without time zone,
    "external_id"            varchar,
    "external_system"        varchar,
    "message"                varchar,
    "last_sync_time"         timestamp without time zone,
    "pending_internal_budget_transfer" numeric,
    "pending_internal_budget_transfer_qty" numeric,
    "pending_internal_budget_transfer_input_qty" numeric,
    "code_segment_values"    varchar,
    "main_contract_item_amount" numeric,
    "approved_cost_payment_application" numeric,
    "approved_budget_payment_application" numeric,
    "locations"              varchar,
    "forecast_adjustment_qty" numeric
);

--
-- Table: cost_change_order_cost_items
--
DROP TABLE IF EXISTS acc_data_schema.cost_change_order_cost_items;
CREATE TABLE acc_data_schema.cost_change_order_cost_items (
    "change_order_id"        uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "cost_item_id"           uuid
);

--
-- Table: cost_change_order_properties
--
DROP TABLE IF EXISTS acc_data_schema.cost_change_order_properties;
CREATE TABLE acc_data_schema.cost_change_order_properties (
    "change_order_id"        uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "built_in"               boolean,
    "position"               numeric,
    "property_definition_id" uuid,
    "type"                   varchar,
    "value"                  varchar
);

--
-- Table: cost_change_orders
--
DROP TABLE IF EXISTS acc_data_schema.cost_change_orders;
CREATE TABLE acc_data_schema.cost_change_orders (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "number"                 varchar,
    "name"                   varchar,
    "description"            varchar,
    "creator_id"             varchar,
    "owner_id"               varchar,
    "changed_by"             varchar,
    "contract_id"            uuid,
    "form_type"              varchar,
    "markup_formula_id"      uuid,
    "applied_by"             varchar,
    "applied_at"             timestamp without time zone,
    "budget_status"          varchar,
    "cost_status"            varchar,
    "scope_of_work"          varchar,
    "note"                   varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "type"                   varchar,
    "schedule_change"        numeric,
    "integration_state"      varchar,
    "integration_state_changed_by" varchar,
    "integration_state_changed_at" timestamp without time zone,
    "external_id"            varchar,
    "external_system"        varchar,
    "message"                varchar,
    "last_sync_time"         timestamp without time zone,
    "proposed_revised_completion_date" timestamp without time zone,
    "source_type"            varchar,
    "approved_at"            timestamp without time zone,
    "status_changed_at"      timestamp without time zone,
    "main_contract_id"       uuid,
    "quantity"               numeric,
    "unit"                   varchar,
    "estimated"              numeric,
    "proposed"               numeric,
    "submitted"              numeric,
    "approved"               numeric,
    "committed"              numeric,
    "compliance_status"      varchar
);

--
-- Table: cost_contract_properties
--
DROP TABLE IF EXISTS acc_data_schema.cost_contract_properties;
CREATE TABLE acc_data_schema.cost_contract_properties (
    "contract_id"            uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "built_in"               boolean,
    "position"               numeric,
    "property_definition_id" uuid,
    "type"                   varchar,
    "value"                  varchar
);

--
-- Table: cost_contracts
--
DROP TABLE IF EXISTS acc_data_schema.cost_contracts;
CREATE TABLE acc_data_schema.cost_contracts (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "code"                   varchar,
    "name"                   varchar,
    "description"            varchar,
    "company_id"             varchar,
    "type"                   varchar,
    "contact_id"             varchar,
    "creator_id"             varchar,
    "signed_by"              varchar,
    "owner_id"               varchar,
    "changed_by"             varchar,
    "status"                 varchar,
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
    "awarded_at"             timestamp without time zone,
    "status_changed_at"      timestamp without time zone,
    "sent_at"                timestamp without time zone,
    "responded_at"           timestamp without time zone,
    "returned_at"            timestamp without time zone,
    "onsite_at"              timestamp without time zone,
    "offsite_at"             timestamp without time zone,
    "procured_at"            timestamp without time zone,
    "approved_at"            timestamp without time zone,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "scope_of_work"          varchar,
    "note"                   varchar,
    "adjustments_total"      numeric,
    "executed_at"            timestamp without time zone,
    "currency"               varchar,
    "exchange_rate"          numeric,
    "integration_state"      varchar,
    "integration_state_changed_by" varchar,
    "integration_state_changed_at" timestamp without time zone,
    "external_id"            varchar,
    "external_system"        varchar,
    "message"                varchar,
    "last_sync_time"         timestamp without time zone,
    "pending_internal_budget_transfer" numeric,
    "compliance_status"      varchar,
    "awarded_tax_total"      numeric,
    "response_due"           timestamp without time zone
);

--
-- Table: cost_cost_item_properties
--
DROP TABLE IF EXISTS acc_data_schema.cost_cost_item_properties;
CREATE TABLE acc_data_schema.cost_cost_item_properties (
    "cost_item_id"           uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "built_in"               boolean,
    "position"               numeric,
    "property_definition_id" uuid,
    "type"                   varchar,
    "value"                  varchar
);

--
-- Table: cost_cost_items
--
DROP TABLE IF EXISTS acc_data_schema.cost_cost_items;
CREATE TABLE acc_data_schema.cost_cost_items (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "number"                 varchar,
    "name"                   varchar,
    "description"            varchar,
    "budget_id"              uuid,
    "budget_status"          varchar,
    "cost_status"            varchar,
    "scope"                  varchar,
    "type"                   varchar,
    "estimated"              numeric,
    "proposed"               numeric,
    "submitted"              numeric,
    "approved"               numeric,
    "committed"              numeric,
    "scope_of_work"          varchar,
    "note"                   varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "schedule_change"        numeric,
    "approved_tax_summary"   varchar,
    "committed_tax_summary"  varchar,
    "estimated_tax_summary"  varchar,
    "proposed_tax_summary"   varchar,
    "submitted_tax_summary"  varchar,
    "is_markup"              boolean,
    "quantity"               numeric,
    "unit"                   varchar
);

--
-- Table: cost_cost_payment_items
--
DROP TABLE IF EXISTS acc_data_schema.cost_cost_payment_items;
CREATE TABLE acc_data_schema.cost_cost_payment_items (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "payment_id"             uuid,
    "parent_id"              uuid,
    "number"                 varchar,
    "name"                   varchar,
    "description"            varchar,
    "unit"                   varchar,
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
    "status"                 varchar,
    "creator_id"             varchar,
    "changed_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "tax_summary"            varchar
);

--
-- Table: cost_cost_payment_properties
--
DROP TABLE IF EXISTS acc_data_schema.cost_cost_payment_properties;
CREATE TABLE acc_data_schema.cost_cost_payment_properties (
    "cost_payment_id"        uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "built_in"               boolean,
    "position"               numeric,
    "property_definition_id" uuid,
    "type"                   varchar,
    "value"                  varchar
);

--
-- Table: cost_cost_payments
--
DROP TABLE IF EXISTS acc_data_schema.cost_cost_payments;
CREATE TABLE acc_data_schema.cost_cost_payments (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "contract_id"            uuid,
    "start_date"             timestamp without time zone,
    "end_date"               timestamp without time zone,
    "due_date"               timestamp without time zone,
    "number"                 varchar,
    "name"                   varchar,
    "description"            varchar,
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
    "status"                 varchar,
    "company_id"             varchar,
    "payment_type"           varchar,
    "payment_reference"      varchar,
    "creator_id"             varchar,
    "changed_by"             varchar,
    "contact_id"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "approved_at"            timestamp without time zone,
    "paid_at"                timestamp without time zone,
    "submitted_at"           timestamp without time zone,
    "note"                   varchar,
    "materials_billed"       numeric,
    "materials_retention"    numeric,
    "integration_state"      varchar,
    "integration_state_changed_by" varchar,
    "integration_state_changed_at" timestamp without time zone,
    "external_id"            varchar,
    "external_system"        varchar,
    "message"                varchar,
    "last_sync_time"         timestamp without time zone,
    "tax_summary"            varchar,
    "compliance_status"      varchar
);

--
-- Table: cost_distribution_item_curves
--
DROP TABLE IF EXISTS acc_data_schema.cost_distribution_item_curves;
CREATE TABLE acc_data_schema.cost_distribution_item_curves (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "distribution_item_id"   uuid,
    "actual_total"           numeric,
    "distribution_total"     numeric,
    "curve"                  varchar,
    "periods"                varchar,
    "actual_total_input_qty" numeric,
    "distribution_total_input_qty" numeric,
    "periods_input_qty"      varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: cost_distribution_items
--
DROP TABLE IF EXISTS acc_data_schema.cost_distribution_items;
CREATE TABLE acc_data_schema.cost_distribution_items (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "budget_id"              varchar,
    "association_id"         uuid,
    "association_type"       varchar,
    "number"                 varchar,
    "name"                   varchar,
    "status"                 varchar,
    "due_date"               timestamp without time zone,
    "company_id"             uuid,
    "contact_id"             varchar,
    "creator_id"             varchar,
    "changed_by"             varchar,
    "submitted_at"           timestamp without time zone,
    "accepted_at"            timestamp without time zone,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: cost_expense_items
--
DROP TABLE IF EXISTS acc_data_schema.cost_expense_items;
CREATE TABLE acc_data_schema.cost_expense_items (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "expense_id"             uuid,
    "budget_id"              uuid,
    "contract_id"            uuid,
    "number"                 varchar,
    "name"                   varchar,
    "description"            varchar,
    "unit"                   varchar,
    "unit_price"             numeric,
    "quantity"               numeric,
    "amount"                 numeric,
    "tax"                    numeric,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: cost_expense_properties
--
DROP TABLE IF EXISTS acc_data_schema.cost_expense_properties;
CREATE TABLE acc_data_schema.cost_expense_properties (
    "expense_id"             uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "built_in"               boolean,
    "position"               numeric,
    "property_definition_id" uuid,
    "type"                   varchar,
    "value"                  varchar
);

--
-- Table: cost_expenses
--
DROP TABLE IF EXISTS acc_data_schema.cost_expenses;
CREATE TABLE acc_data_schema.cost_expenses (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "number"                 varchar,
    "name"                   varchar,
    "description"            varchar,
    "creator_id"             varchar,
    "changed_by"             varchar,
    "supplier_id"            varchar,
    "supplier_name"          varchar,
    "amount"                 numeric,
    "paid_amount"            numeric,
    "status"                 varchar,
    "type"                   varchar,
    "payment_type"           varchar,
    "payment_reference"      varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "issued_at"              timestamp without time zone,
    "received_at"            timestamp without time zone,
    "approved_at"            timestamp without time zone,
    "paid_at"                timestamp without time zone,
    "reference_number"       varchar,
    "integration_state"      varchar,
    "integration_state_changed_by" varchar,
    "integration_state_changed_at" timestamp without time zone,
    "external_id"            varchar,
    "external_system"        varchar,
    "message"                varchar,
    "last_sync_time"         timestamp without time zone,
    "payment_due"            timestamp without time zone
);

--
-- Table: cost_main_contract_items
--
DROP TABLE IF EXISTS acc_data_schema.cost_main_contract_items;
CREATE TABLE acc_data_schema.cost_main_contract_items (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "main_contract_id"       uuid,
    "budget_id"              uuid,
    "parent_id"              uuid,
    "code"                   varchar,
    "name"                   varchar,
    "description"            varchar,
    "qty"                    numeric,
    "unit_price"             numeric,
    "unit"                   varchar,
    "amount"                 numeric,
    "changed_by"             varchar,
    "is_private"             boolean,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: cost_main_contract_properties
--
DROP TABLE IF EXISTS acc_data_schema.cost_main_contract_properties;
CREATE TABLE acc_data_schema.cost_main_contract_properties (
    "main_contract_id"       uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "built_in"               boolean,
    "position"               numeric,
    "property_definition_id" uuid,
    "type"                   varchar,
    "value"                  varchar
);

--
-- Table: cost_main_contracts
--
DROP TABLE IF EXISTS acc_data_schema.cost_main_contracts;
CREATE TABLE acc_data_schema.cost_main_contracts (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "code"                   varchar,
    "name"                   varchar,
    "description"            varchar,
    "type"                   varchar,
    "status"                 varchar,
    "amount"                 numeric,
    "retention_cap"          numeric,
    "contact_id"             varchar,
    "creator_id"             varchar,
    "owner_id"               varchar,
    "changed_by"             varchar,
    "scope_of_work"          varchar,
    "note"                   varchar,
    "start_date"             timestamp without time zone,
    "executed_date"          timestamp without time zone,
    "planned_completion_date" timestamp without time zone,
    "actual_completion_date" timestamp without time zone,
    "close_date"             timestamp without time zone,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "revised_completion_date" timestamp without time zone,
    "schedule_change"        numeric
);

--
-- Table: cost_payment_references
--
DROP TABLE IF EXISTS acc_data_schema.cost_payment_references;
CREATE TABLE acc_data_schema.cost_payment_references (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "amount"                 numeric,
    "type"                   varchar,
    "reference"              varchar,
    "paid_at"                timestamp without time zone,
    "association_id"         uuid,
    "association_type"       varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: cost_permissions
--
DROP TABLE IF EXISTS acc_data_schema.cost_permissions;
CREATE TABLE acc_data_schema.cost_permissions (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "policy_id"              uuid,
    "subject_id"             varchar,
    "subject_type"           varchar,
    "permission_level"       varchar,
    "resource_type"          varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: cost_schedule_of_values_properties
--
DROP TABLE IF EXISTS acc_data_schema.cost_schedule_of_values_properties;
CREATE TABLE acc_data_schema.cost_schedule_of_values_properties (
    "schedule_of_value_id"   uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "built_in"               boolean,
    "position"               numeric,
    "property_definition_id" uuid,
    "type"                   varchar,
    "value"                  varchar
);

--
-- Table: cost_sub_distribution_items
--
DROP TABLE IF EXISTS acc_data_schema.cost_sub_distribution_items;
CREATE TABLE acc_data_schema.cost_sub_distribution_items (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "distribution_item_id"   uuid,
    "association_id"         varchar,
    "association_type"       varchar,
    "number"                 varchar,
    "name"                   varchar,
    "start_date"             date,
    "end_date"               date,
    "actual_total"           numeric,
    "distribution_total"     numeric,
    "type"                   varchar,
    "curve"                  varchar,
    "periods"                varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "actual_total_input_qty" numeric,
    "distribution_total_input_qty" numeric,
    "periods_input_qty"      varchar
);

--
-- Table: cost_transferences
--
DROP TABLE IF EXISTS acc_data_schema.cost_transferences;
CREATE TABLE acc_data_schema.cost_transferences (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "budget_id"              uuid,
    "relating_budget_id"     uuid,
    "contract_id"            uuid,
    "relating_contract_id"   uuid,
    "transaction_id"         uuid,
    "amount"                 numeric,
    "unit_price"             numeric,
    "qty"                    numeric,
    "input_qty"              numeric,
    "relating_unit_price"    numeric,
    "relating_qty"           numeric,
    "relating_input_qty"     numeric,
    "creator_id"             varchar,
    "note"                   varchar,
    "main_contract_id"       uuid,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

-- =================================================================
-- # Schema: dailylogs
-- =================================================================
--
-- Table: dailylogs_dailylogs
--
DROP TABLE IF EXISTS acc_data_schema.dailylogs_dailylogs;
CREATE TABLE acc_data_schema.dailylogs_dailylogs (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "date"                   timestamp without time zone,
    "company_id"             varchar,
    "status"                 varchar,
    "created_by"             varchar,
    "updated_by"             varchar,
    "published_by"           varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "published_at"           timestamp without time zone
);

--
-- Table: dailylogs_labor_items
--
DROP TABLE IF EXISTS acc_data_schema.dailylogs_labor_items;
CREATE TABLE acc_data_schema.dailylogs_labor_items (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "company_id"             uuid,
    "labor_id"               varchar,
    "company_oxygen_id"      varchar,
    "workers_count"          numeric,
    "total_hours"            numeric,
    "comment"                varchar,
    "created_by"             varchar,
    "updated_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: dailylogs_labors
--
DROP TABLE IF EXISTS acc_data_schema.dailylogs_labors;
CREATE TABLE acc_data_schema.dailylogs_labors (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "daily_log_id"           varchar,
    "title"                  varchar,
    "created_by"             varchar,
    "updated_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: dailylogs_notes
--
DROP TABLE IF EXISTS acc_data_schema.dailylogs_notes;
CREATE TABLE acc_data_schema.dailylogs_notes (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "daily_log_id"           varchar,
    "title"                  varchar,
    "content"                varchar,
    "created_by"             varchar,
    "updated_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: dailylogs_weather_logs
--
DROP TABLE IF EXISTS acc_data_schema.dailylogs_weather_logs;
CREATE TABLE acc_data_schema.dailylogs_weather_logs (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "daily_log_id"           varchar,
    "title"                  varchar,
    "location"               varchar,
    "description"            varchar,
    "highest_temperature"    numeric,
    "highest_temperature_time" timestamp without time zone,
    "lowest_temperature"     numeric,
    "lowest_temperature_time" timestamp without time zone,
    "visibility"             numeric,
    "humidity"               numeric,
    "wind"                   numeric,
    "precipitation"          numeric,
    "notes"                  varchar,
    "created_by"             varchar,
    "updated_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

-- =================================================================
-- # Schema: estimates
-- =================================================================
--
-- Table: estimates_cost_markup_formula_bond_levels
--
DROP TABLE IF EXISTS acc_data_schema.estimates_cost_markup_formula_bond_levels;
CREATE TABLE acc_data_schema.estimates_cost_markup_formula_bond_levels (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "item_id"                uuid,
    "order"                  numeric,
    "amount"                 numeric,
    "percentage"             numeric,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: estimates_cost_markup_formula_items
--
DROP TABLE IF EXISTS acc_data_schema.estimates_cost_markup_formula_items;
CREATE TABLE acc_data_schema.estimates_cost_markup_formula_items (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "section_id"             uuid,
    "description"            varchar,
    "order"                  numeric,
    "markup_type"            varchar,
    "cost_basis_source"      varchar,
    "cost_basis_section_id"  uuid,
    "amount"                 numeric,
    "percentage"             numeric,
    "total"                  numeric,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: estimates_cost_markup_formula_sections
--
DROP TABLE IF EXISTS acc_data_schema.estimates_cost_markup_formula_sections;
CREATE TABLE acc_data_schema.estimates_cost_markup_formula_sections (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "formula_id"             uuid,
    "description"            varchar,
    "order"                  numeric,
    "total"                  numeric,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: estimates_cost_markup_formulas
--
DROP TABLE IF EXISTS acc_data_schema.estimates_cost_markup_formulas;
CREATE TABLE acc_data_schema.estimates_cost_markup_formulas (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "total"                  numeric,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: estimates_equipment_cost_calculations
--
DROP TABLE IF EXISTS acc_data_schema.estimates_equipment_cost_calculations;
CREATE TABLE acc_data_schema.estimates_equipment_cost_calculations (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "equipment_type"         varchar,
    "rate"                   numeric,
    "productivity"           numeric,
    "productivity_unit"      varchar,
    "rounding"               varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: estimates_estimation_instances
--
DROP TABLE IF EXISTS acc_data_schema.estimates_estimation_instances;
CREATE TABLE acc_data_schema.estimates_estimation_instances (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "unit_of_measure"        varchar,
    "part_number"            varchar,
    "barcode"                varchar,
    "quantity"               numeric,
    "takeoff_instance_count" numeric,
    "material_cost_calculation_id" uuid,
    "material_cost_total"    numeric,
    "labor_cost_calculation_id" uuid,
    "labor_cost_total"       numeric,
    "equipment_cost_calculation_id" uuid,
    "equipment_cost_total"   numeric,
    "other_cost_rate"        numeric,
    "other_cost_total"       numeric,
    "subcontractor_cost_rate" numeric,
    "subcontractor_cost_total" numeric,
    "total_cost"             numeric,
    "markup_total"           numeric,
    "classification1_id"     uuid,
    "classification2_id"     uuid,
    "content_lineage_id"     uuid,
    "package_id"             uuid,
    "location_id"            uuid,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: estimates_labor_cost_calculations
--
DROP TABLE IF EXISTS acc_data_schema.estimates_labor_cost_calculations;
CREATE TABLE acc_data_schema.estimates_labor_cost_calculations (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "labor_type"             varchar,
    "rate_type"              varchar,
    "rate"                   numeric,
    "daily_hours"            numeric,
    "productivity"           numeric,
    "productivity_unit"      varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: estimates_material_cost_calculations
--
DROP TABLE IF EXISTS acc_data_schema.estimates_material_cost_calculations;
CREATE TABLE acc_data_schema.estimates_material_cost_calculations (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "rate"                   numeric,
    "factor"                 numeric,
    "factor_unit"            varchar,
    "waste_percentage"       numeric,
    "rounding"               varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: estimates_settings
--
DROP TABLE IF EXISTS acc_data_schema.estimates_settings;
CREATE TABLE acc_data_schema.estimates_settings (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "measurement_system"     varchar,
    "currency"               varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

-- =================================================================
-- # Schema: forms
-- =================================================================
--
-- Table: forms_form_attachments
--
DROP TABLE IF EXISTS acc_data_schema.forms_form_attachments;
CREATE TABLE acc_data_schema.forms_form_attachments (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "form_id"                uuid,
    "attachment_id"          uuid,
    "attachment_type"        varchar,
    "item_urn"               varchar,
    "is_deleted"             boolean,
    "updated_by"             varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: forms_form_files
--
DROP TABLE IF EXISTS acc_data_schema.forms_form_files;
CREATE TABLE acc_data_schema.forms_form_files (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "form_id"                uuid,
    "extracted_form_data"    varchar
);

--
-- Table: forms_form_sections
--
DROP TABLE IF EXISTS acc_data_schema.forms_form_sections;
CREATE TABLE acc_data_schema.forms_form_sections (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "form_uid"               uuid,
    "status"                 varchar,
    "assignee_id"            varchar,
    "assignee_type"          varchar,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "user_created_at"        timestamp without time zone,
    "last_completed_by"      varchar,
    "last_completed_at"      timestamp without time zone,
    "last_reopened_by"       varchar,
    "last_reopened_at"       timestamp without time zone
);

--
-- Table: forms_form_templates
--
DROP TABLE IF EXISTS acc_data_schema.forms_form_templates;
CREATE TABLE acc_data_schema.forms_form_templates (
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "status"                 varchar,
    "file_id"                uuid,
    "native_form_id"         uuid,
    "template_type"          varchar
);

--
-- Table: forms_forms
--
DROP TABLE IF EXISTS acc_data_schema.forms_forms;
CREATE TABLE acc_data_schema.forms_forms (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "template_id"            uuid,
    "status"                 varchar,
    "assignee_id"            varchar,
    "number"                 numeric,
    "form_date"              date,
    "notes"                  varchar,
    "description"            varchar,
    "weather_id"             numeric,
    "native_form_id"         uuid,
    "file_id"                uuid,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "location_id"            uuid,
    "last_reopened_by"       uuid,
    "last_submitter_signature" varchar,
    "due_date"               date,
    "created_at"             timestamp without time zone,
    "last_submitted_at"      timestamp without time zone,
    "assignee_type_id"       varchar,
    "assignee_type"          varchar,
    "name"                   varchar,
    "last_submitted_by"      varchar
);

--
-- Table: forms_layout_section_items
--
DROP TABLE IF EXISTS acc_data_schema.forms_layout_section_items;
CREATE TABLE acc_data_schema.forms_layout_section_items (
    "uid"                    uuid,
    "layout_uid"             uuid,
    "section_uid"            uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "sort_index"             numeric,
    "label"                  varchar,
    "schema"                 varchar,
    "value_name"             varchar,
    "description"            varchar,
    "is_required"            boolean,
    "modifier"               varchar,
    "presets"                varchar,
    "type"                   varchar,
    "display_index"          numeric,
    "field_id_v2"            uuid
);

--
-- Table: forms_layout_sections
--
DROP TABLE IF EXISTS acc_data_schema.forms_layout_sections;
CREATE TABLE acc_data_schema.forms_layout_sections (
    "uid"                    uuid,
    "layout_uid"             uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "sort_index"             numeric,
    "label"                  varchar,
    "description"            varchar,
    "form_section_id"        uuid,
    "assignee_id"            varchar,
    "assignee_type"          varchar,
    "display_index"          numeric
);

--
-- Table: forms_layout_table_columns
--
DROP TABLE IF EXISTS acc_data_schema.forms_layout_table_columns;
CREATE TABLE acc_data_schema.forms_layout_table_columns (
    "uid"                    uuid,
    "layout_uid"             uuid,
    "section_item_uid"       uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "sort_index"             numeric,
    "presets"                varchar,
    "value_name"             varchar,
    "values_provider"        varchar,
    "label"                  varchar,
    "column_key"             varchar,
    "column_type"            varchar,
    "expression"             varchar
);

--
-- Table: forms_layouts
--
DROP TABLE IF EXISTS acc_data_schema.forms_layouts;
CREATE TABLE acc_data_schema.forms_layouts (
    "uid"                    uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "description"            varchar,
    "has_section_assignees"  boolean,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "user_created_at"        timestamp without time zone,
    "sequential_section_completion" boolean
);

--
-- Table: forms_native_form_section_item_attachments
--
DROP TABLE IF EXISTS acc_data_schema.forms_native_form_section_item_attachments;
CREATE TABLE acc_data_schema.forms_native_form_section_item_attachments (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "native_form_id"         uuid,
    "section_item_uid"       uuid,
    "attachment_id"          uuid,
    "attachment_type"        varchar,
    "item_urn"               varchar,
    "is_deleted"             boolean,
    "updated_by"             varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: forms_native_form_tabular_values
--
DROP TABLE IF EXISTS acc_data_schema.forms_native_form_tabular_values;
CREATE TABLE acc_data_schema.forms_native_form_tabular_values (
    "native_form_id"         uuid,
    "layout_table_column_id" uuid,
    "layout_section_item_id" uuid,
    "native_form_value_id"   uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "field_id"               varchar,
    "text_val"               varchar,
    "number_val"             numeric,
    "integer_val"            numeric,
    "array_val"              varchar,
    "uid_val"                uuid,
    "svg_val"                varchar,
    "timespan_val"           varchar,
    "datetime_local_val"     timestamp without time zone,
    "datetime_utc_val"       timestamp without time zone,
    "timezone_val"           varchar,
    "lat_val"                numeric,
    "lng_val"                numeric,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "date_val"               date,
    "time_val"               time,
    "field_id_v2"            uuid
);

--
-- Table: forms_native_form_values
--
DROP TABLE IF EXISTS acc_data_schema.forms_native_form_values;
CREATE TABLE acc_data_schema.forms_native_form_values (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "native_form_id"         uuid,
    "rank"                   numeric,
    "field_id"               varchar,
    "notes"                  varchar,
    "name"                   varchar,
    "svg_val"                varchar,
    "array_val"              varchar,
    "number_val"             numeric,
    "text_val"               varchar,
    "choice_val"             varchar,
    "toggle_val"             numeric,
    "date_val"               date,
    "description"            varchar,
    "item"                   varchar,
    "quantity"               numeric,
    "unit"                   varchar,
    "timespan"               varchar,
    "trade"                  varchar,
    "headcount"              numeric,
    "company_id"             uuid,
    "role_id"                uuid,
    "ot_timespan"            varchar,
    "role_name"              varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "field_id_v2"            uuid
);

--
-- Table: forms_native_forms
--
DROP TABLE IF EXISTS acc_data_schema.forms_native_forms;
CREATE TABLE acc_data_schema.forms_native_forms (
    "updated_at"             timestamp without time zone,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "id"                     uuid,
    "template_id"            uuid,
    "layout_uid"             uuid
);

--
-- Table: forms_weather
--
DROP TABLE IF EXISTS acc_data_schema.forms_weather;
CREATE TABLE acc_data_schema.forms_weather (
    "id"                     numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "date"                   date,
    "summary_key"            varchar,
    "temperature_min"        numeric,
    "temperature_max"        numeric,
    "humidity"               numeric,
    "wind_speed"             numeric,
    "wind_gust"              numeric,
    "wind_bearing"           numeric,
    "fetched_at"             timestamp without time zone,
    "precipitation_accumulation" numeric
);

--
-- Table: forms_weather_hours
--
DROP TABLE IF EXISTS acc_data_schema.forms_weather_hours;
CREATE TABLE acc_data_schema.forms_weather_hours (
    "weather_id"             numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "hour"                   time,
    "summary_key"            varchar,
    "temp"                   numeric,
    "wind_speed"             numeric,
    "wind_bearing"           numeric,
    "humidity"               numeric,
    "fetched_at"             timestamp without time zone,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

-- =================================================================
-- # Schema: iq
-- =================================================================
--
-- Table: iq_company_daily_quality_risk_changes
--
DROP TABLE IF EXISTS acc_data_schema.iq_company_daily_quality_risk_changes;
CREATE TABLE acc_data_schema.iq_company_daily_quality_risk_changes (
    "id"                     uuid,
    "company_id"             uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "start_time"             timestamp without time zone,
    "daily_risk"             varchar,
    "daily_risk_indicator"   numeric,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: iq_company_daily_safety_risk_changes
--
DROP TABLE IF EXISTS acc_data_schema.iq_company_daily_safety_risk_changes;
CREATE TABLE acc_data_schema.iq_company_daily_safety_risk_changes (
    "id"                     uuid,
    "company_id"             uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "start_date"             timestamp without time zone,
    "daily_safety_risk"      numeric,
    "daily_safety_risk_indicator" numeric,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: iq_cost_impact_issues
--
DROP TABLE IF EXISTS acc_data_schema.iq_cost_impact_issues;
CREATE TABLE acc_data_schema.iq_cost_impact_issues (
    "id"                     uuid,
    "updated_at"             timestamp without time zone,
    "predicted_at"           timestamp without time zone,
    "cost_impact"            varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid
);

--
-- Table: iq_design_issues_building_components
--
DROP TABLE IF EXISTS acc_data_schema.iq_design_issues_building_components;
CREATE TABLE acc_data_schema.iq_design_issues_building_components (
    "id"                     uuid,
    "updated_at"             timestamp without time zone,
    "predicted_at"           timestamp without time zone,
    "building_component"     varchar,
    "user_building_component" varchar,
    "building_component_keyword" varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid
);

--
-- Table: iq_design_issues_root_cause
--
DROP TABLE IF EXISTS acc_data_schema.iq_design_issues_root_cause;
CREATE TABLE acc_data_schema.iq_design_issues_root_cause (
    "id"                     uuid,
    "updated_at"             timestamp without time zone,
    "predicted_at"           timestamp without time zone,
    "root_cause"             varchar,
    "user_root_cause"        varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid
);

--
-- Table: iq_inspection_risk_issues
--
DROP TABLE IF EXISTS acc_data_schema.iq_inspection_risk_issues;
CREATE TABLE acc_data_schema.iq_inspection_risk_issues (
    "id"                     uuid,
    "updated_at"             timestamp without time zone,
    "predicted_at"           timestamp without time zone,
    "inspection_risk"        boolean,
    "user_category"          varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid
);

--
-- Table: iq_issues_quality_categories
--
DROP TABLE IF EXISTS acc_data_schema.iq_issues_quality_categories;
CREATE TABLE acc_data_schema.iq_issues_quality_categories (
    "id"                     uuid,
    "predicted_at"           timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "category"               varchar,
    "user_category"          varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid
);

--
-- Table: iq_issues_quality_risks
--
DROP TABLE IF EXISTS acc_data_schema.iq_issues_quality_risks;
CREATE TABLE acc_data_schema.iq_issues_quality_risks (
    "id"                     uuid,
    "predicted_at"           timestamp without time zone,
    "risk"                   varchar,
    "updated_at"             timestamp without time zone,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "user_risk"              varchar
);

--
-- Table: iq_issues_safety_hazard
--
DROP TABLE IF EXISTS acc_data_schema.iq_issues_safety_hazard;
CREATE TABLE acc_data_schema.iq_issues_safety_hazard (
    "id"                     uuid,
    "updated_at"             timestamp without time zone,
    "predicted_at"           timestamp without time zone,
    "safety_hazard_category" varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid
);

--
-- Table: iq_issues_safety_observations
--
DROP TABLE IF EXISTS acc_data_schema.iq_issues_safety_observations;
CREATE TABLE acc_data_schema.iq_issues_safety_observations (
    "id"                     uuid,
    "updated_at"             timestamp without time zone,
    "predicted_at"           timestamp without time zone,
    "safety_observation_category" varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid
);

--
-- Table: iq_issues_safety_risk
--
DROP TABLE IF EXISTS acc_data_schema.iq_issues_safety_risk;
CREATE TABLE acc_data_schema.iq_issues_safety_risk (
    "id"                     uuid,
    "updated_at"             timestamp without time zone,
    "predicted_at"           timestamp without time zone,
    "safety_risk_category"   varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid
);

--
-- Table: iq_project_daily_quality_risk_changes
--
DROP TABLE IF EXISTS acc_data_schema.iq_project_daily_quality_risk_changes;
CREATE TABLE acc_data_schema.iq_project_daily_quality_risk_changes (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "start_time"             timestamp without time zone,
    "daily_risk"             varchar,
    "daily_risk_indicator"   numeric,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: iq_rfis_building_components
--
DROP TABLE IF EXISTS acc_data_schema.iq_rfis_building_components;
CREATE TABLE acc_data_schema.iq_rfis_building_components (
    "id"                     uuid,
    "updated_at"             timestamp without time zone,
    "predicted_at"           timestamp without time zone,
    "building_component"     varchar,
    "building_component_keyword" varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid
);

--
-- Table: iq_rfis_disciplines
--
DROP TABLE IF EXISTS acc_data_schema.iq_rfis_disciplines;
CREATE TABLE acc_data_schema.iq_rfis_disciplines (
    "id"                     uuid,
    "updated_at"             timestamp without time zone,
    "predicted_at"           timestamp without time zone,
    "discipline"             varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid
);

--
-- Table: iq_rfis_high_risk
--
DROP TABLE IF EXISTS acc_data_schema.iq_rfis_high_risk;
CREATE TABLE acc_data_schema.iq_rfis_high_risk (
    "id"                     uuid,
    "updated_at"             timestamp without time zone,
    "predicted_at"           timestamp without time zone,
    "risk"                   varchar,
    "score"                  numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid
);

--
-- Table: iq_rfis_root_cause
--
DROP TABLE IF EXISTS acc_data_schema.iq_rfis_root_cause;
CREATE TABLE acc_data_schema.iq_rfis_root_cause (
    "id"                     uuid,
    "updated_at"             timestamp without time zone,
    "predicted_at"           timestamp without time zone,
    "root_cause"             varchar,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid
);

-- =================================================================
-- # Schema: issues
-- =================================================================
--
-- Table: issues_attachments
--
DROP TABLE IF EXISTS acc_data_schema.issues_attachments;
CREATE TABLE acc_data_schema.issues_attachments (
    "attachment_id"          uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "issue_id"               uuid,
    "display_name"           varchar,
    "file_name"              varchar,
    "storage_urn"            varchar,
    "file_size"              numeric,
    "file_type"              varchar,
    "lineage_urn"            varchar,
    "version"                numeric,
    "version_urn"            varchar,
    "tip_version_urn"        varchar,
    "bubble_urn"             varchar,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar
);

--
-- Table: issues_checklist_mappings
--
DROP TABLE IF EXISTS acc_data_schema.issues_checklist_mappings;
CREATE TABLE acc_data_schema.issues_checklist_mappings (
    "issue_id"               uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "checklist_id"           varchar,
    "checklist_item"         varchar,
    "checklist_section"      varchar
);

--
-- Table: issues_comments
--
DROP TABLE IF EXISTS acc_data_schema.issues_comments;
CREATE TABLE acc_data_schema.issues_comments (
    "comment_id"             uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "issue_id"               uuid,
    "comment_body"           varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone
);

--
-- Table: issues_custom_attribute_list_values
--
DROP TABLE IF EXISTS acc_data_schema.issues_custom_attribute_list_values;
CREATE TABLE acc_data_schema.issues_custom_attribute_list_values (
    "attribute_mappings_id"  uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "list_id"                uuid,
    "list_value"             varchar
);

--
-- Table: issues_custom_attributes
--
DROP TABLE IF EXISTS acc_data_schema.issues_custom_attributes;
CREATE TABLE acc_data_schema.issues_custom_attributes (
    "issue_id"               uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "mapped_item_type"       varchar,
    "attribute_mapping_id"   uuid,
    "attribute_title"        varchar,
    "attribute_description"  varchar,
    "attribute_data_type"    varchar,
    "is_required"            boolean,
    "attribute_value"        varchar
);

--
-- Table: issues_custom_attributes_mappings
--
DROP TABLE IF EXISTS acc_data_schema.issues_custom_attributes_mappings;
CREATE TABLE acc_data_schema.issues_custom_attributes_mappings (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "mapped_item_type"       varchar,
    "mapped_item_id"         uuid,
    "title"                  varchar,
    "description"            varchar,
    "data_type"              varchar,
    "order"                  numeric,
    "is_required"            boolean,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar
);

--
-- Table: issues_issue_subtypes
--
DROP TABLE IF EXISTS acc_data_schema.issues_issue_subtypes;
CREATE TABLE acc_data_schema.issues_issue_subtypes (
    "issue_subtype_id"       uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "issue_type_id"          uuid,
    "issue_subtype"          varchar,
    "is_active"              boolean,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "deleted_at"             timestamp without time zone
);

--
-- Table: issues_issue_types
--
DROP TABLE IF EXISTS acc_data_schema.issues_issue_types;
CREATE TABLE acc_data_schema.issues_issue_types (
    "issue_type_id"          uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "issue_type"             varchar,
    "is_active"              boolean,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "deleted_at"             timestamp without time zone
);

--
-- Table: issues_issues
--
DROP TABLE IF EXISTS acc_data_schema.issues_issues;
CREATE TABLE acc_data_schema.issues_issues (
    "issue_id"               uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "display_id"             numeric,
    "title"                  varchar,
    "description"            varchar,
    "type_id"                uuid,
    "subtype_id"             uuid,
    "status"                 varchar,
    "assignee_id"            varchar,
    "assignee_type"          varchar,
    "due_date"               timestamp without time zone,
    "location_id"            uuid,
    "location_details"       varchar,
    "linked_document_urn"    varchar,
    "owner_id"               varchar,
    "root_cause_id"          uuid,
    "root_cause_category_id" uuid,
    "response"               varchar,
    "response_by"            varchar,
    "response_at"            timestamp without time zone,
    "opened_by"              varchar,
    "opened_at"              timestamp without time zone,
    "closed_by"              varchar,
    "closed_at"              timestamp without time zone,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "start_date"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "snapshot_urn"           varchar,
    "published"              boolean,
    "gps_coordinates"        varchar,
    "deleted_by"             varchar
);

--
-- Table: issues_placements
--
DROP TABLE IF EXISTS acc_data_schema.issues_placements;
CREATE TABLE acc_data_schema.issues_placements (
    "placement_id"           uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "issue_id"               uuid,
    "lineage_urn"            varchar,
    "type"                   varchar,
    "created_at_version"     numeric,
    "origin_product"         varchar,
    "origin_tool"            varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "deleted_at"             timestamp without time zone
);

--
-- Table: issues_root_cause_categories
--
DROP TABLE IF EXISTS acc_data_schema.issues_root_cause_categories;
CREATE TABLE acc_data_schema.issues_root_cause_categories (
    "root_cause_category_id" uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "root_cause_category"    varchar,
    "is_active"              boolean,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "is_system"              boolean
);

--
-- Table: issues_root_causes
--
DROP TABLE IF EXISTS acc_data_schema.issues_root_causes;
CREATE TABLE acc_data_schema.issues_root_causes (
    "root_cause_id"          uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "root_cause_category_id" uuid,
    "title"                  varchar,
    "is_active"              boolean,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "is_system"              boolean
);

--
-- Table: issues_viewables
--
DROP TABLE IF EXISTS acc_data_schema.issues_viewables;
CREATE TABLE acc_data_schema.issues_viewables (
    "placement_id"           uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "issue_id"               uuid,
    "file_version"           numeric,
    "file_version_urn"       varchar,
    "guid"                   varchar,
    "name"                   varchar,
    "viewable_id"            varchar,
    "is_3d"                  boolean,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone
);

-- =================================================================
-- # Schema: issuesbim360
-- =================================================================
--
-- Table: issuesbim360_attachments
--
DROP TABLE IF EXISTS acc_data_schema.issuesbim360_attachments;
CREATE TABLE acc_data_schema.issuesbim360_attachments (
    "attachment_id"          uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "issue_id"               uuid,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "attachment_type"        varchar,
    "attachment_name"        varchar
);

--
-- Table: issuesbim360_checklist_mappings
--
DROP TABLE IF EXISTS acc_data_schema.issuesbim360_checklist_mappings;
CREATE TABLE acc_data_schema.issuesbim360_checklist_mappings (
    "issue_id"               uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "checklist_id"           varchar,
    "checklist_item"         varchar,
    "checklist_section"      varchar
);

--
-- Table: issuesbim360_comments
--
DROP TABLE IF EXISTS acc_data_schema.issuesbim360_comments;
CREATE TABLE acc_data_schema.issuesbim360_comments (
    "comment_id"             uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "issue_id"               uuid,
    "comment_body"           varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone
);

--
-- Table: issuesbim360_custom_attribute_list_values
--
DROP TABLE IF EXISTS acc_data_schema.issuesbim360_custom_attribute_list_values;
CREATE TABLE acc_data_schema.issuesbim360_custom_attribute_list_values (
    "attribute_mappings_id"  uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "list_id"                uuid,
    "list_value"             varchar
);

--
-- Table: issuesbim360_custom_attributes
--
DROP TABLE IF EXISTS acc_data_schema.issuesbim360_custom_attributes;
CREATE TABLE acc_data_schema.issuesbim360_custom_attributes (
    "issue_id"               uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "mapped_item_type"       varchar,
    "attribute_mapping_id"   uuid,
    "attribute_title"        varchar,
    "attribute_description"  varchar,
    "attribute_data_type"    varchar,
    "is_required"            boolean,
    "attribute_value"        varchar
);

--
-- Table: issuesbim360_custom_attributes_mappings
--
DROP TABLE IF EXISTS acc_data_schema.issuesbim360_custom_attributes_mappings;
CREATE TABLE acc_data_schema.issuesbim360_custom_attributes_mappings (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "mapped_item_type"       varchar,
    "mapped_item_id"         uuid,
    "title"                  varchar,
    "description"            varchar,
    "data_type"              varchar,
    "order"                  numeric,
    "is_required"            boolean,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar
);

--
-- Table: issuesbim360_issue_subtypes
--
DROP TABLE IF EXISTS acc_data_schema.issuesbim360_issue_subtypes;
CREATE TABLE acc_data_schema.issuesbim360_issue_subtypes (
    "issue_subtype_id"       uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "issue_type_id"          uuid,
    "issue_subtype"          varchar,
    "is_active"              boolean,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "deleted_at"             timestamp without time zone
);

--
-- Table: issuesbim360_issue_types
--
DROP TABLE IF EXISTS acc_data_schema.issuesbim360_issue_types;
CREATE TABLE acc_data_schema.issuesbim360_issue_types (
    "issue_type_id"          uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "issue_type"             varchar,
    "is_active"              boolean,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "deleted_at"             timestamp without time zone
);

--
-- Table: issuesbim360_issues
--
DROP TABLE IF EXISTS acc_data_schema.issuesbim360_issues;
CREATE TABLE acc_data_schema.issuesbim360_issues (
    "issue_id"               uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "display_id"             numeric,
    "title"                  varchar,
    "description"            varchar,
    "type_id"                uuid,
    "subtype_id"             uuid,
    "status"                 varchar,
    "assignee_id"            varchar,
    "assignee_type"          varchar,
    "due_date"               timestamp without time zone,
    "location_id"            uuid,
    "location_details"       varchar,
    "linked_document_urn"    varchar,
    "owner_id"               varchar,
    "root_cause_id"          uuid,
    "root_cause_category_id" uuid,
    "response"               varchar,
    "response_by"            varchar,
    "response_at"            timestamp without time zone,
    "opened_by"              varchar,
    "opened_at"              timestamp without time zone,
    "closed_by"              varchar,
    "closed_at"              timestamp without time zone,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "start_date"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "snapshot_urn"           varchar,
    "published"              boolean,
    "gps_coordinates"        varchar,
    "deleted_by"             varchar
);

--
-- Table: issuesbim360_root_cause_categories
--
DROP TABLE IF EXISTS acc_data_schema.issuesbim360_root_cause_categories;
CREATE TABLE acc_data_schema.issuesbim360_root_cause_categories (
    "root_cause_category_id" uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "root_cause_category"    varchar,
    "is_active"              boolean,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "is_system"              boolean
);

--
-- Table: issuesbim360_root_causes
--
DROP TABLE IF EXISTS acc_data_schema.issuesbim360_root_causes;
CREATE TABLE acc_data_schema.issuesbim360_root_causes (
    "root_cause_id"          uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "root_cause_category_id" uuid,
    "title"                  varchar,
    "is_active"              boolean,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "is_system"              boolean
);

-- =================================================================
-- # Schema: locations
-- =================================================================
--
-- Table: locations_nodes
--
DROP TABLE IF EXISTS acc_data_schema.locations_nodes;
CREATE TABLE acc_data_schema.locations_nodes (
    "tree_id"                uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "parent_id"              uuid,
    "id"                     uuid,
    "name"                   varchar,
    "order"                  numeric,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: locations_trees
--
DROP TABLE IF EXISTS acc_data_schema.locations_trees;
CREATE TABLE acc_data_schema.locations_trees (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

-- =================================================================
-- # Schema: markups
-- =================================================================
--
-- Table: markups_layer
--
DROP TABLE IF EXISTS acc_data_schema.markups_layer;
CREATE TABLE acc_data_schema.markups_layer (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "uid"                    uuid,
    "surface_uid"            uuid,
    "name"                   varchar,
    "promotable"             boolean,
    "surface_type"           varchar,
    "base_entity_urn"        varchar,
    "base_entity_uid"        uuid
);

--
-- Table: markups_link
--
DROP TABLE IF EXISTS acc_data_schema.markups_link;
CREATE TABLE acc_data_schema.markups_link (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "uid"                    uuid,
    "markup_id"              numeric,
    "type"                   varchar,
    "destination"            uuid,
    "uri"                    varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "deleted"                boolean,
    "deleted_by"             varchar,
    "deleted_at"             timestamp without time zone
);

--
-- Table: markups_markup
--
DROP TABLE IF EXISTS acc_data_schema.markups_markup;
CREATE TABLE acc_data_schema.markups_markup (
    "id"                     numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "uid"                    uuid,
    "feature_bound_uid"      uuid,
    "feature_bound_type"     varchar,
    "type"                   varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted"                boolean,
    "deleted_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "markup_text"            varchar
);

--
-- Table: markups_placement
--
DROP TABLE IF EXISTS acc_data_schema.markups_placement;
CREATE TABLE acc_data_schema.markups_placement (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "markup_uid"             uuid,
    "surface_uid"            uuid,
    "published"              boolean,
    "layer_uid"              uuid,
    "id"                     numeric,
    "uid"                    uuid,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted"                boolean,
    "deleted_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "placement_text"         varchar
);

-- =================================================================
-- # Schema: meetingminutes
-- =================================================================
--
-- Table: meetingminutes_assignees
--
DROP TABLE IF EXISTS acc_data_schema.meetingminutes_assignees;
CREATE TABLE acc_data_schema.meetingminutes_assignees (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "item_id"                uuid,
    "participant_id"         uuid,
    "non_member_participant_id" uuid,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone
);

--
-- Table: meetingminutes_attachments
--
DROP TABLE IF EXISTS acc_data_schema.meetingminutes_attachments;
CREATE TABLE acc_data_schema.meetingminutes_attachments (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "item_id"                uuid,
    "meeting_id"             uuid,
    "uri"                    varchar,
    "origin"                 varchar,
    "name"                   varchar,
    "created_by"             varchar,
    "updated_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone
);

--
-- Table: meetingminutes_items
--
DROP TABLE IF EXISTS acc_data_schema.meetingminutes_items;
CREATE TABLE acc_data_schema.meetingminutes_items (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "topic_id"               uuid,
    "order_index"            numeric,
    "description"            varchar,
    "status"                 varchar,
    "cross_series_id"        uuid,
    "due_date"               timestamp without time zone,
    "created_by"             varchar,
    "updated_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone
);

--
-- Table: meetingminutes_meetings
--
DROP TABLE IF EXISTS acc_data_schema.meetingminutes_meetings;
CREATE TABLE acc_data_schema.meetingminutes_meetings (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "series_id"              uuid,
    "title"                  varchar,
    "description"            varchar,
    "summary"                varchar,
    "status"                 varchar,
    "num_in_series"          numeric,
    "meeting_location"       varchar,
    "starts_at"              timestamp without time zone,
    "duration"               numeric,
    "video_conference_link"  varchar,
    "created_by"             varchar,
    "updated_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone
);

--
-- Table: meetingminutes_non_member_participants
--
DROP TABLE IF EXISTS acc_data_schema.meetingminutes_non_member_participants;
CREATE TABLE acc_data_schema.meetingminutes_non_member_participants (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "meeting_id"             uuid,
    "first_name"             varchar,
    "last_name"              varchar,
    "company"                varchar,
    "email"                  varchar,
    "status"                 varchar,
    "created_by"             varchar,
    "updated_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone
);

--
-- Table: meetingminutes_participants
--
DROP TABLE IF EXISTS acc_data_schema.meetingminutes_participants;
CREATE TABLE acc_data_schema.meetingminutes_participants (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "meeting_id"             uuid,
    "autodesk_id"            varchar,
    "type"                   varchar,
    "status"                 varchar,
    "created_by"             varchar,
    "updated_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone
);

--
-- Table: meetingminutes_topics
--
DROP TABLE IF EXISTS acc_data_schema.meetingminutes_topics;
CREATE TABLE acc_data_schema.meetingminutes_topics (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "meeting_id"             uuid,
    "order_index"            numeric,
    "name"                   varchar,
    "created_by"             varchar,
    "updated_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone
);

-- =================================================================
-- # Schema: packages
-- =================================================================
--
-- Table: packages_package_associations
--
DROP TABLE IF EXISTS acc_data_schema.packages_package_associations;
CREATE TABLE acc_data_schema.packages_package_associations (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "package_id"             uuid,
    "version_id"             uuid
);

--
-- Table: packages_package_roles
--
DROP TABLE IF EXISTS acc_data_schema.packages_package_roles;
CREATE TABLE acc_data_schema.packages_package_roles (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "adsk_id"                varchar,
    "adsk_id_type"           varchar,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "status"                 varchar
);

--
-- Table: packages_packages
--
DROP TABLE IF EXISTS acc_data_schema.packages_packages;
CREATE TABLE acc_data_schema.packages_packages (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "locked"                 boolean,
    "locked_at"              timestamp without time zone,
    "locked_by"              varchar,
    "name"                   varchar,
    "description"            varchar,
    "resource_count"         numeric,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "version_resource_option" varchar
);

--
-- Table: packages_version_resources
--
DROP TABLE IF EXISTS acc_data_schema.packages_version_resources;
CREATE TABLE acc_data_schema.packages_version_resources (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "version_id"             uuid,
    "urn"                    varchar,
    "version"                numeric,
    "revision"               numeric,
    "file_type"              varchar,
    "path"                   varchar,
    "trashed"                boolean,
    "name"                   varchar,
    "file_size"              numeric,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar
);

-- =================================================================
-- # Schema: photos
-- =================================================================
--
-- Table: photos_photo_tags
--
DROP TABLE IF EXISTS acc_data_schema.photos_photo_tags;
CREATE TABLE acc_data_schema.photos_photo_tags (
    "id"                     numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "seq_id"                 numeric,
    "project_id"             varchar,
    "photo_id"               varchar,
    "tag_name"               varchar,
    "tag_type"               varchar,
    "created_at"             timestamp without time zone,
    "creator_id"             varchar,
    "deleted_at"             timestamp without time zone,
    "deleter_id"             varchar,
    "model_version"          numeric
);

--
-- Table: photos_photos
--
DROP TABLE IF EXISTS acc_data_schema.photos_photos;
CREATE TABLE acc_data_schema.photos_photos (
    "id"                     numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "title"                  varchar,
    "size"                   numeric,
    "status"                 varchar,
    "annotation"             varchar,
    "punch"                  varchar,
    "creator_id"             varchar,
    "deleter_id"             varchar,
    "updater_id"             varchar,
    "lat"                    numeric,
    "lng"                    numeric,
    "uid"                    varchar,
    "description"            varchar,
    "image_type"             varchar,
    "type"                   varchar,
    "taken_on"               timestamp without time zone,
    "locked_at"              timestamp without time zone,
    "is_public"              boolean,
    "created_at"             timestamp without time zone,
    "user_created_at"        timestamp without time zone,
    "updated_on"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "project"                varchar,
    "seq_id"                 numeric,
    "sheet"                  varchar
);

--
-- Table: photos_referencer_participants
--
DROP TABLE IF EXISTS acc_data_schema.photos_referencer_participants;
CREATE TABLE acc_data_schema.photos_referencer_participants (
    "id"                     numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "project_id"             varchar,
    "referencer_urn"         varchar,
    "participant_id"         varchar,
    "participant_type"       varchar,
    "created_at"             timestamp without time zone
);

--
-- Table: photos_referencer_photos
--
DROP TABLE IF EXISTS acc_data_schema.photos_referencer_photos;
CREATE TABLE acc_data_schema.photos_referencer_photos (
    "id"                     numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "project_id"             varchar,
    "referencer_urn"         varchar,
    "photo_id"               varchar,
    "created_at"             timestamp without time zone,
    "edge_urn"               varchar
);

-- =================================================================
-- # Schema: relationships
-- =================================================================
--
-- Table: relationships_entity_relationship
--
DROP TABLE IF EXISTS acc_data_schema.relationships_entity_relationship;
CREATE TABLE acc_data_schema.relationships_entity_relationship (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "relationship_guid"      uuid,
    "item1_domain"           varchar,
    "item1_entitytype"       varchar,
    "item1_id"               varchar,
    "item2_domain"           varchar,
    "item2_entitytype"       varchar,
    "item2_id"               varchar,
    "created_on"             timestamp without time zone,
    "deleted_on"             timestamp without time zone,
    "is_deleted"             boolean,
    "is_service_owned"       boolean
);

-- =================================================================
-- # Schema: reviews
-- =================================================================
--
-- Table: reviews_review_candidates
--
DROP TABLE IF EXISTS acc_data_schema.reviews_review_candidates;
CREATE TABLE acc_data_schema.reviews_review_candidates (
    "id"                     uuid,
    "sequence_id"            numeric,
    "instance_id"            uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "step_id"                varchar,
    "step_name"              varchar,
    "candidate_type"         varchar,
    "candidate_oxygen_id"    varchar
);

--
-- Table: reviews_review_comments
--
DROP TABLE IF EXISTS acc_data_schema.reviews_review_comments;
CREATE TABLE acc_data_schema.reviews_review_comments (
    "id"                     numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "review_document_id"     uuid,
    "created_by"             varchar,
    "status"                 varchar,
    "text"                   varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "round_num"              numeric
);

--
-- Table: reviews_review_documents
--
DROP TABLE IF EXISTS acc_data_schema.reviews_review_documents;
CREATE TABLE acc_data_schema.reviews_review_documents (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "review_id"              uuid,
    "versioned_urn"          varchar,
    "status"                 varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "round_num"              numeric
);

--
-- Table: reviews_review_steps
--
DROP TABLE IF EXISTS acc_data_schema.reviews_review_steps;
CREATE TABLE acc_data_schema.reviews_review_steps (
    "id"                     uuid,
    "sequence_id"            numeric,
    "instance_id"            uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "workflow_id"            uuid,
    "step_id"                varchar,
    "step_name"              varchar,
    "step_display_name"      varchar
);

--
-- Table: reviews_review_tasks
--
DROP TABLE IF EXISTS acc_data_schema.reviews_review_tasks;
CREATE TABLE acc_data_schema.reviews_review_tasks (
    "id"                     numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "review_id"              uuid,
    "task_id"                uuid,
    "task_key"               varchar,
    "name"                   varchar,
    "assignee"               varchar,
    "next_task_key"          varchar,
    "state"                  varchar,
    "due_date"               timestamp without time zone,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "step_id"                varchar
);

--
-- Table: reviews_review_workflow_templates
--
DROP TABLE IF EXISTS acc_data_schema.reviews_review_workflow_templates;
CREATE TABLE acc_data_schema.reviews_review_workflow_templates (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "template_id"            uuid,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: reviews_review_workflows
--
DROP TABLE IF EXISTS acc_data_schema.reviews_review_workflows;
CREATE TABLE acc_data_schema.reviews_review_workflows (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "workflow_template_id"   uuid,
    "form_id"                uuid,
    "name"                   varchar,
    "description"            varchar,
    "status"                 varchar,
    "bpmn_urn"               varchar,
    "memo"                   varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: reviews_reviews
--
DROP TABLE IF EXISTS acc_data_schema.reviews_reviews;
CREATE TABLE acc_data_schema.reviews_reviews (
    "id"                     uuid,
    "sequence_id"            numeric,
    "instance_id"            uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "workflow_id"            uuid,
    "status"                 varchar,
    "review_name"            varchar,
    "memo"                   varchar,
    "created_by"             varchar,
    "next_due_date"          timestamp without time zone,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "docs_count"             numeric,
    "approved_count"         numeric,
    "rejected_count"         numeric,
    "workflow_name"          varchar,
    "started_at"             timestamp without time zone,
    "finished_at"            timestamp without time zone,
    "next_action_candidates_users" varchar,
    "next_action_candidates_roles" varchar,
    "next_action_candidates_companies" varchar,
    "next_action_claimed_by" varchar,
    "current_round_num"      numeric,
    "current_step"           numeric,
    "total_steps"            numeric,
    "is_archived"            boolean
);

--
-- Table: reviews_workflow_notes
--
DROP TABLE IF EXISTS acc_data_schema.reviews_workflow_notes;
CREATE TABLE acc_data_schema.reviews_workflow_notes (
    "id"                     numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "review_id"              uuid,
    "created_by"             varchar,
    "note"                   varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "round_num"              numeric
);

-- =================================================================
-- # Schema: rfis
-- =================================================================
--
-- Table: rfis_acc_attachments
--
DROP TABLE IF EXISTS acc_data_schema.rfis_acc_attachments;
CREATE TABLE acc_data_schema.rfis_acc_attachments (
    "id"                     uuid,
    "rfi_id"                 uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "entity_id"              uuid,
    "entity_type"            varchar,
    "display_name"           varchar,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "deleted_by"             varchar
);

--
-- Table: rfis_attachments
--
DROP TABLE IF EXISTS acc_data_schema.rfis_attachments;
CREATE TABLE acc_data_schema.rfis_attachments (
    "rfi_id"                 uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "id"                     uuid,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "name"                   varchar
);

--
-- Table: rfis_category
--
DROP TABLE IF EXISTS acc_data_schema.rfis_category;
CREATE TABLE acc_data_schema.rfis_category (
    "rfi_id"                 uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "category"               varchar
);

--
-- Table: rfis_comments
--
DROP TABLE IF EXISTS acc_data_schema.rfis_comments;
CREATE TABLE acc_data_schema.rfis_comments (
    "rfi_id"                 uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "id"                     uuid,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "body"                   varchar
);

--
-- Table: rfis_discipline
--
DROP TABLE IF EXISTS acc_data_schema.rfis_discipline;
CREATE TABLE acc_data_schema.rfis_discipline (
    "rfi_id"                 uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "discipline"             varchar
);

--
-- Table: rfis_project_custom_attributes
--
DROP TABLE IF EXISTS acc_data_schema.rfis_project_custom_attributes;
CREATE TABLE acc_data_schema.rfis_project_custom_attributes (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "type"                   varchar,
    "description"            varchar,
    "multiple_choice"        boolean,
    "status"                 varchar
);

--
-- Table: rfis_project_custom_attributes_enums
--
DROP TABLE IF EXISTS acc_data_schema.rfis_project_custom_attributes_enums;
CREATE TABLE acc_data_schema.rfis_project_custom_attributes_enums (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "custom_attribute_id"    uuid,
    "name"                   varchar
);

--
-- Table: rfis_rfi_assignees
--
DROP TABLE IF EXISTS acc_data_schema.rfis_rfi_assignees;
CREATE TABLE acc_data_schema.rfis_rfi_assignees (
    "id"                     uuid,
    "rfi_id"                 uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "oxygen_id"              varchar,
    "type"                   varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone
);

--
-- Table: rfis_rfi_co_reviewers
--
DROP TABLE IF EXISTS acc_data_schema.rfis_rfi_co_reviewers;
CREATE TABLE acc_data_schema.rfis_rfi_co_reviewers (
    "rfi_id"                 uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "user_id"                varchar
);

--
-- Table: rfis_rfi_custom_attributes
--
DROP TABLE IF EXISTS acc_data_schema.rfis_rfi_custom_attributes;
CREATE TABLE acc_data_schema.rfis_rfi_custom_attributes (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "rfi_id"                 uuid,
    "custom_attribute_id"    uuid,
    "value_enum_id"          uuid,
    "value_float"            numeric,
    "value_str"              varchar
);

--
-- Table: rfis_rfi_distribution_list
--
DROP TABLE IF EXISTS acc_data_schema.rfis_rfi_distribution_list;
CREATE TABLE acc_data_schema.rfis_rfi_distribution_list (
    "rfi_id"                 uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "user_id"                varchar
);

--
-- Table: rfis_rfi_location
--
DROP TABLE IF EXISTS acc_data_schema.rfis_rfi_location;
CREATE TABLE acc_data_schema.rfis_rfi_location (
    "rfi_id"                 uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "location"               varchar
);

--
-- Table: rfis_rfi_responses
--
DROP TABLE IF EXISTS acc_data_schema.rfis_rfi_responses;
CREATE TABLE acc_data_schema.rfis_rfi_responses (
    "id"                     uuid,
    "rfi_id"                 uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "content"                varchar,
    "updated_by"             varchar,
    "created_by"             varchar,
    "on_behalf"              varchar,
    "status"                 varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "state"                  varchar
);

--
-- Table: rfis_rfi_reviewers
--
DROP TABLE IF EXISTS acc_data_schema.rfis_rfi_reviewers;
CREATE TABLE acc_data_schema.rfis_rfi_reviewers (
    "rfi_id"                 uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "user_id"                varchar,
    "type"                   varchar
);

--
-- Table: rfis_rfi_transitions
--
DROP TABLE IF EXISTS acc_data_schema.rfis_rfi_transitions;
CREATE TABLE acc_data_schema.rfis_rfi_transitions (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "rfi_id"                 uuid,
    "from_status"            varchar,
    "to_status"              varchar,
    "created_at"             timestamp without time zone,
    "created_by"             varchar
);

--
-- Table: rfis_rfi_types
--
DROP TABLE IF EXISTS acc_data_schema.rfis_rfi_types;
CREATE TABLE acc_data_schema.rfis_rfi_types (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "wf_type"                varchar
);

--
-- Table: rfis_rfis
--
DROP TABLE IF EXISTS acc_data_schema.rfis_rfis;
CREATE TABLE acc_data_schema.rfis_rfis (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "custom_identifier"      varchar,
    "title"                  varchar,
    "question"               varchar,
    "status"                 varchar,
    "due_date"               timestamp without time zone,
    "linked_document"        varchar,
    "linked_document_version" numeric,
    "linked_document_close_version" numeric,
    "official_response"      varchar,
    "official_response_status" varchar,
    "responded_at"           timestamp without time zone,
    "responded_by"           varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "closed_by"              varchar,
    "closed_at"              timestamp without time zone,
    "suggested_answer"       varchar,
    "manager_id"             varchar,
    "answered_at"            timestamp without time zone,
    "answered_by"            varchar,
    "cost_impact"            varchar,
    "schedule_impact"        varchar,
    "priority"               varchar,
    "reference"              varchar,
    "opened_at"              timestamp without time zone,
    "location_id"            varchar,
    "rfi_type"               uuid,
    "bridged_source"         boolean,
    "bridged_target"         boolean
);

-- =================================================================
-- # Schema: schedule
-- =================================================================
--
-- Table: schedule_activities
--
DROP TABLE IF EXISTS acc_data_schema.schedule_activities;
CREATE TABLE acc_data_schema.schedule_activities (
    "id"                     uuid,
    "schedule_id"            uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "unique_id"              numeric,
    "sequential_id"          numeric,
    "file_activity_id"       varchar,
    "parent_unique_id"       numeric,
    "type"                   varchar,
    "name"                   varchar,
    "is_critical_path"       boolean,
    "completion_percentage"  numeric,
    "planned_start"          timestamp without time zone,
    "planned_finish"         timestamp without time zone,
    "actual_start"           timestamp without time zone,
    "actual_finish"          timestamp without time zone,
    "start"                  timestamp without time zone,
    "finish"                 timestamp without time zone,
    "duration"               numeric,
    "actual_duration"        numeric,
    "remaining_duration"     numeric,
    "free_slack_units"       varchar,
    "free_slack_duration"    numeric,
    "total_slack_units"      varchar,
    "total_slack_duration"   numeric,
    "is_wbs"                 boolean,
    "wbs_path"               varchar,
    "wbs_code"               varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "wbs_path_text"          varchar
);

--
-- Table: schedule_activity_codes
--
DROP TABLE IF EXISTS acc_data_schema.schedule_activity_codes;
CREATE TABLE acc_data_schema.schedule_activity_codes (
    "id"                     uuid,
    "schedule_id"            uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_unique_id"     numeric,
    "name"                   varchar,
    "value"                  varchar,
    "value_description"      varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: schedule_comments
--
DROP TABLE IF EXISTS acc_data_schema.schedule_comments;
CREATE TABLE acc_data_schema.schedule_comments (
    "id"                     uuid,
    "schedule_id"            uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_unique_id"     numeric,
    "body"                   varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone
);

--
-- Table: schedule_dependencies
--
DROP TABLE IF EXISTS acc_data_schema.schedule_dependencies;
CREATE TABLE acc_data_schema.schedule_dependencies (
    "id"                     uuid,
    "schedule_id"            uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "source_unique_id"       numeric,
    "target_unique_id"       numeric,
    "type"                   varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: schedule_plan_commitments
--
DROP TABLE IF EXISTS acc_data_schema.schedule_plan_commitments;
CREATE TABLE acc_data_schema.schedule_plan_commitments (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "plan_id"                uuid,
    "task_id"                uuid,
    "replanned_commitment_id" uuid,
    "root_cause_id"          uuid,
    "task_type"              varchar,
    "work_type"              varchar,
    "status"                 varchar,
    "start_date"             date,
    "finish_date"            date,
    "duration"               numeric,
    "assigned_member_id"     varchar,
    "assigned_company_id"    varchar,
    "assigned_role_id"       varchar,
    "location_id"            uuid,
    "wbs_id"                 uuid,
    "crew_size"              numeric,
    "was_start_changed"      boolean,
    "was_duration_changed"   boolean,
    "was_finish_changed"     boolean,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone
);

--
-- Table: schedule_plan_handoffs
--
DROP TABLE IF EXISTS acc_data_schema.schedule_plan_handoffs;
CREATE TABLE acc_data_schema.schedule_plan_handoffs (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "plan_id"                uuid,
    "source_task"            uuid,
    "target_task"            uuid,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone
);

--
-- Table: schedule_plan_plans
--
DROP TABLE IF EXISTS acc_data_schema.schedule_plan_plans;
CREATE TABLE acc_data_schema.schedule_plan_plans (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "schedule_id"            uuid,
    "created_by"             varchar,
    "updated_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: schedule_plan_project_settings
--
DROP TABLE IF EXISTS acc_data_schema.schedule_plan_project_settings;
CREATE TABLE acc_data_schema.schedule_plan_project_settings (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "non_working_dates"      varchar,
    "first_day_of_the_week"  varchar,
    "working_days"           varchar,
    "wbs_tree"               varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone
);

--
-- Table: schedule_plan_task_comments
--
DROP TABLE IF EXISTS acc_data_schema.schedule_plan_task_comments;
CREATE TABLE acc_data_schema.schedule_plan_task_comments (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "task_id"                uuid,
    "plan_id"                uuid,
    "body"                   varchar,
    "created_at"             timestamp without time zone,
    "created_by"             varchar
);

--
-- Table: schedule_plan_tasks
--
DROP TABLE IF EXISTS acc_data_schema.schedule_plan_tasks;
CREATE TABLE acc_data_schema.schedule_plan_tasks (
    "id"                     uuid,
    "plan_id"                uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "parent_task_id"         uuid,
    "activity_unique_id"     numeric,
    "unique_id"              numeric,
    "task_type"              varchar,
    "work_type"              varchar,
    "status"                 varchar,
    "title"                  varchar,
    "description"            varchar,
    "start_date"             date,
    "finish_date"            date,
    "duration"               numeric,
    "location_id"            uuid,
    "assigned_member_id"     varchar,
    "assigned_company_id"    varchar,
    "assigned_role_id"       varchar,
    "wbs_id"                 uuid,
    "completion_percentage"  numeric,
    "crew_size"              numeric,
    "priority"               numeric,
    "comments_count"         numeric,
    "commitments_count"      numeric,
    "task_imports_id"        varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone
);

--
-- Table: schedule_resources
--
DROP TABLE IF EXISTS acc_data_schema.schedule_resources;
CREATE TABLE acc_data_schema.schedule_resources (
    "id"                     uuid,
    "schedule_id"            uuid,
    "resource_unique_id"     numeric,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "activity_unique_id"     numeric,
    "name"                   varchar,
    "type"                   varchar,
    "email_address"          varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: schedule_schedules
--
DROP TABLE IF EXISTS acc_data_schema.schedule_schedules;
CREATE TABLE acc_data_schema.schedule_schedules (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "type"                   varchar,
    "version_number"         numeric,
    "is_public"              boolean,
    "created_by"             varchar,
    "updated_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

-- =================================================================
-- # Schema: sheets
-- =================================================================
--
-- Table: sheets_disciplines
--
DROP TABLE IF EXISTS acc_data_schema.sheets_disciplines;
CREATE TABLE acc_data_schema.sheets_disciplines (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "container_type"         varchar,
    "index"                  numeric,
    "name"                   varchar,
    "designator"             varchar
);

--
-- Table: sheets_lineages
--
DROP TABLE IF EXISTS acc_data_schema.sheets_lineages;
CREATE TABLE acc_data_schema.sheets_lineages (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "container_type"         varchar,
    "name"                   varchar
);

--
-- Table: sheets_sets
--
DROP TABLE IF EXISTS acc_data_schema.sheets_sets;
CREATE TABLE acc_data_schema.sheets_sets (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "container_type"         varchar,
    "name"                   varchar,
    "issuance_date"          timestamp without time zone,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "created_by_name"        varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_by_name"        varchar
);

--
-- Table: sheets_sheet_bubbles
--
DROP TABLE IF EXISTS acc_data_schema.sheets_sheet_bubbles;
CREATE TABLE acc_data_schema.sheets_sheet_bubbles (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "container_type"         varchar,
    "sheet_id"               uuid,
    "urn"                    varchar,
    "viewable_guid"          varchar,
    "paper_width"            numeric,
    "paper_height"           numeric,
    "viewable_order"         numeric,
    "pug_urn"                varchar,
    "pug_width"              numeric,
    "pug_height"             numeric,
    "large_thumbnail_width"  numeric,
    "large_thumbnail_height" numeric,
    "small_thumbnail_width"  numeric,
    "small_thumbnail_height" numeric,
    "storage_urn"            varchar,
    "storage_size"           numeric,
    "viewable_urn"           varchar,
    "viewable_width"         numeric,
    "viewable_height"        numeric
);

--
-- Table: sheets_sheet_tags
--
DROP TABLE IF EXISTS acc_data_schema.sheets_sheet_tags;
CREATE TABLE acc_data_schema.sheets_sheet_tags (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "container_type"         varchar,
    "sheet_id"               uuid,
    "value"                  varchar
);

--
-- Table: sheets_sheets
--
DROP TABLE IF EXISTS acc_data_schema.sheets_sheets;
CREATE TABLE acc_data_schema.sheets_sheets (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "container_type"         varchar,
    "name"                   varchar,
    "nat_sort_name"          varchar,
    "history_id"             uuid,
    "version_set_id"         uuid,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "created_by_name"        varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_by_name"        varchar,
    "title"                  varchar,
    "upload_file_name"       varchar,
    "upload_id"              uuid,
    "processing_state"       varchar,
    "is_current"             boolean,
    "discipline_index"       numeric,
    "deleted"                boolean,
    "deleted_at"             timestamp without time zone,
    "deleted_by"             varchar,
    "deleted_by_name"        varchar,
    "original_set_name"      varchar
);

-- =================================================================
-- # Schema: submittals
-- =================================================================
--
-- Table: submittals_attachments
--
DROP TABLE IF EXISTS acc_data_schema.submittals_attachments;
CREATE TABLE acc_data_schema.submittals_attachments (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "item_id"                uuid,
    "name"                   varchar,
    "is_response"            boolean,
    "revision"               numeric,
    "attachment_type_id"     varchar,
    "type_value"             varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "is_review"              boolean,
    "is_deleted"             boolean,
    "deleted_at"             timestamp without time zone,
    "upload_urn"             varchar
);

--
-- Table: submittals_comments
--
DROP TABLE IF EXISTS acc_data_schema.submittals_comments;
CREATE TABLE acc_data_schema.submittals_comments (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "item_id"                uuid,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "body"                   varchar,
    "is_deleted"             boolean,
    "deleted_at"             timestamp without time zone
);

--
-- Table: submittals_item_cc_users
--
DROP TABLE IF EXISTS acc_data_schema.submittals_item_cc_users;
CREATE TABLE acc_data_schema.submittals_item_cc_users (
    "item_id"                uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "user_id"                varchar
);

--
-- Table: submittals_item_co_reviewers_users
--
DROP TABLE IF EXISTS acc_data_schema.submittals_item_co_reviewers_users;
CREATE TABLE acc_data_schema.submittals_item_co_reviewers_users (
    "item_id"                uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "user_id"                varchar
);

--
-- Table: submittals_item_distribution_list_users
--
DROP TABLE IF EXISTS acc_data_schema.submittals_item_distribution_list_users;
CREATE TABLE acc_data_schema.submittals_item_distribution_list_users (
    "item_id"                uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "user_id"                varchar,
    "user_type_id"           varchar,
    "user_type_value"        varchar
);

--
-- Table: submittals_itemrevisions
--
DROP TABLE IF EXISTS acc_data_schema.submittals_itemrevisions;
CREATE TABLE acc_data_schema.submittals_itemrevisions (
    "revision"               numeric,
    "item_id"                uuid,
    "item_title"             varchar,
    "item_identifier"        numeric,
    "spec_title"             varchar,
    "spec_identifier"        varchar,
    "spec_id"                uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid
);

--
-- Table: submittals_items
--
DROP TABLE IF EXISTS acc_data_schema.submittals_items;
CREATE TABLE acc_data_schema.submittals_items (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "spec_id"                uuid,
    "spec_identifier"        varchar,
    "title"                  varchar,
    "type_id"                varchar,
    "type_value"             varchar,
    "response_comment"       varchar,
    "assigned_to"            varchar,
    "revision"               numeric,
    "responded_by"           varchar,
    "description"            varchar,
    "responded_at"           timestamp without time zone,
    "due_date"               date,
    "required_on_job_date"   date,
    "manager"                varchar,
    "reviewer"               varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "state_id"               varchar,
    "response_id"            varchar,
    "response_value"         varchar,
    "subsection"             varchar,
    "subcontractor"          varchar,
    "identifier"             numeric,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "status_id"              varchar,
    "status_value"           varchar,
    "package_title"          varchar,
    "package"                uuid,
    "package_identifier"     numeric,
    "priority_id"            numeric,
    "priority_value"         varchar,
    "required_date"          date,
    "required_approval_date" date,
    "lead_time"              numeric,
    "sent_to_submitter"      timestamp without time zone,
    "received_from_submitter" timestamp without time zone,
    "sent_to_reviewer"       timestamp without time zone,
    "received_from_reviewer" timestamp without time zone,
    "published_date"         timestamp without time zone,
    "submitter_due_date"     date,
    "manager_due_date"       date,
    "reviewer_due_date"      date
);

--
-- Table: submittals_packages
--
DROP TABLE IF EXISTS acc_data_schema.submittals_packages;
CREATE TABLE acc_data_schema.submittals_packages (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "spec_id"                uuid,
    "title"                  varchar,
    "identifier"             numeric,
    "updated_by"             varchar,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "deleted_at"             timestamp without time zone,
    "is_deleted"             boolean,
    "spec_identifier"        varchar
);

--
-- Table: submittals_specs
--
DROP TABLE IF EXISTS acc_data_schema.submittals_specs;
CREATE TABLE acc_data_schema.submittals_specs (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "updated_by"             varchar,
    "title"                  varchar,
    "identifier"             varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "is_deleted"             boolean,
    "deleted_at"             timestamp without time zone
);

-- =================================================================
-- # Schema: submittalsacc
-- =================================================================
--
-- Table: submittalsacc_attachments
--
DROP TABLE IF EXISTS acc_data_schema.submittalsacc_attachments;
CREATE TABLE acc_data_schema.submittalsacc_attachments (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "item_id"                uuid,
    "name"                   varchar,
    "revision"               numeric,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "upload_urn"             varchar,
    "category_id"            varchar,
    "category_value"         varchar,
    "task_id"                uuid,
    "is_file_uploaded"       boolean,
    "urn"                    varchar
);

--
-- Table: submittalsacc_comments
--
DROP TABLE IF EXISTS acc_data_schema.submittalsacc_comments;
CREATE TABLE acc_data_schema.submittalsacc_comments (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "item_id"                uuid,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "body"                   varchar
);

--
-- Table: submittalsacc_custom_identifier_settings
--
DROP TABLE IF EXISTS acc_data_schema.submittalsacc_custom_identifier_settings;
CREATE TABLE acc_data_schema.submittalsacc_custom_identifier_settings (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "can_switch_type"        boolean,
    "sequence_type"          varchar
);

--
-- Table: submittalsacc_item_custom_attribute_value
--
DROP TABLE IF EXISTS acc_data_schema.submittalsacc_item_custom_attribute_value;
CREATE TABLE acc_data_schema.submittalsacc_item_custom_attribute_value (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "item_id"                uuid,
    "parameter_id"           uuid,
    "parameter_name"         varchar,
    "parameter_type"         varchar,
    "value"                  varchar,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "select_value"           varchar
);

--
-- Table: submittalsacc_item_revision
--
DROP TABLE IF EXISTS acc_data_schema.submittalsacc_item_revision;
CREATE TABLE acc_data_schema.submittalsacc_item_revision (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "id"                     uuid,
    "item_id"                uuid,
    "manager"                varchar,
    "manager_type"           varchar,
    "subcontractor"          varchar,
    "subcontractor_type"     varchar,
    "revision"               numeric,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "sent_to_submitter"      timestamp without time zone,
    "submitter_due_date"     date,
    "received_from_submitter" timestamp without time zone,
    "submitted_by"           varchar,
    "sent_to_review"         timestamp without time zone,
    "manager_due_date"       date,
    "sent_to_review_by"      varchar,
    "received_from_review"   timestamp without time zone,
    "response_id"            varchar,
    "response_comment"       varchar,
    "responded_at"           timestamp without time zone,
    "responded_by"           varchar,
    "published_date"         timestamp without time zone,
    "published_by"           varchar
);

--
-- Table: submittalsacc_item_watchers
--
DROP TABLE IF EXISTS acc_data_schema.submittalsacc_item_watchers;
CREATE TABLE acc_data_schema.submittalsacc_item_watchers (
    "item_id"                uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "user_id"                varchar,
    "user_type_id"           varchar,
    "user_type_value"        varchar
);

--
-- Table: submittalsacc_items
--
DROP TABLE IF EXISTS acc_data_schema.submittalsacc_items;
CREATE TABLE acc_data_schema.submittalsacc_items (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "spec_id"                uuid,
    "spec_identifier"        varchar,
    "title"                  varchar,
    "type_id"                varchar,
    "type_value"             varchar,
    "response_comment"       varchar,
    "ball_in_court"          varchar,
    "revision"               numeric,
    "responded_by"           varchar,
    "description"            varchar,
    "responded_at"           timestamp without time zone,
    "due_date"               date,
    "required_on_job_date"   date,
    "manager"                varchar,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "state_id"               varchar,
    "response_id"            varchar,
    "response_value"         varchar,
    "subsection"             varchar,
    "subcontractor"          varchar,
    "identifier"             numeric,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "status_id"              varchar,
    "status_value"           varchar,
    "package_title"          varchar,
    "package"                uuid,
    "package_identifier"     numeric,
    "priority_id"            numeric,
    "priority_value"         varchar,
    "required_date"          date,
    "required_approval_date" date,
    "lead_time"              numeric,
    "sent_to_submitter"      timestamp without time zone,
    "received_from_submitter" timestamp without time zone,
    "submitted_by"           varchar,
    "sent_to_review"         timestamp without time zone,
    "sent_to_review_by"      varchar,
    "received_from_review"   timestamp without time zone,
    "published_date"         timestamp without time zone,
    "published_by"           varchar,
    "submitter_due_date"     date,
    "manager_due_date"       date,
    "ball_in_court_users"    varchar,
    "ball_in_court_roles"    varchar,
    "ball_in_court_companies" varchar,
    "manager_type"           varchar,
    "subcontractor_type"     varchar,
    "custom_identifier"      varchar,
    "custom_identifier_sort" varchar,
    "custom_identifier_human_readable" varchar,
    "pending_actions_from"   varchar
);

--
-- Table: submittalsacc_itemtype
--
DROP TABLE IF EXISTS acc_data_schema.submittalsacc_itemtype;
CREATE TABLE acc_data_schema.submittalsacc_itemtype (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "created_at"             timestamp without time zone,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "created_by"             varchar,
    "value"                  varchar,
    "platform_id"            varchar,
    "is_active"              boolean
);

--
-- Table: submittalsacc_packages
--
DROP TABLE IF EXISTS acc_data_schema.submittalsacc_packages;
CREATE TABLE acc_data_schema.submittalsacc_packages (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "spec_id"                uuid,
    "title"                  varchar,
    "identifier"             numeric,
    "description"            varchar,
    "updated_by"             varchar,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "spec_identifier"        varchar
);

--
-- Table: submittalsacc_parameters_collections
--
DROP TABLE IF EXISTS acc_data_schema.submittalsacc_parameters_collections;
CREATE TABLE acc_data_schema.submittalsacc_parameters_collections (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "parameter_id"           uuid,
    "parameter_external_id"  varchar,
    "parameter_name"         varchar,
    "parameter_description"  varchar,
    "parameter_type"         varchar,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar,
    "deleted_at"             timestamp without time zone,
    "parameter_select_options" varchar
);

--
-- Table: submittalsacc_specs
--
DROP TABLE IF EXISTS acc_data_schema.submittalsacc_specs;
CREATE TABLE acc_data_schema.submittalsacc_specs (
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "id"                     uuid,
    "identifier"             varchar,
    "title"                  varchar,
    "created_at"             timestamp without time zone,
    "created_by"             varchar,
    "updated_at"             timestamp without time zone,
    "updated_by"             varchar
);

--
-- Table: submittalsacc_steps
--
DROP TABLE IF EXISTS acc_data_schema.submittalsacc_steps;
CREATE TABLE acc_data_schema.submittalsacc_steps (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "status"                 varchar,
    "step_number"            numeric,
    "days_to_respond"        numeric,
    "due_date"               date,
    "started_at"             timestamp without time zone,
    "completed_at"           timestamp without time zone,
    "item_id"                uuid
);

--
-- Table: submittalsacc_tasks
--
DROP TABLE IF EXISTS acc_data_schema.submittalsacc_tasks;
CREATE TABLE acc_data_schema.submittalsacc_tasks (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "updated_by"             varchar,
    "updated_at"             timestamp without time zone,
    "created_by"             varchar,
    "created_at"             timestamp without time zone,
    "status"                 varchar,
    "assigned_to"            varchar,
    "is_required"            boolean,
    "response_comment"       varchar,
    "responded_at"           timestamp without time zone,
    "responded_by"           varchar,
    "started_at"             timestamp without time zone,
    "completed_at"           timestamp without time zone,
    "completed_by"           varchar,
    "response_value"         varchar,
    "response_id"            uuid,
    "step_id"                uuid,
    "assigned_to_type"       varchar
);

-- =================================================================
-- # Schema: takeoff
-- =================================================================
--
-- Table: takeoff_carbon_definitions
--
DROP TABLE IF EXISTS acc_data_schema.takeoff_carbon_definitions;
CREATE TABLE acc_data_schema.takeoff_carbon_definitions (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "declared_unit"          varchar,
    "unit_of_measure"        varchar,
    "a1_a2_a3_achievable"    numeric,
    "a1_a2_a3_conservative"  numeric,
    "a1_a2_a3_mean"          numeric,
    "a1_a2_a3_standard_deviation" numeric
);

--
-- Table: takeoff_classification_systems
--
DROP TABLE IF EXISTS acc_data_schema.takeoff_classification_systems;
CREATE TABLE acc_data_schema.takeoff_classification_systems (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "type"                   varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: takeoff_classifications
--
DROP TABLE IF EXISTS acc_data_schema.takeoff_classifications;
CREATE TABLE acc_data_schema.takeoff_classifications (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "system_id"              uuid,
    "code"                   varchar,
    "parent_code"            varchar,
    "description"            varchar,
    "parent_id"              uuid
);

--
-- Table: takeoff_content_lineages
--
DROP TABLE IF EXISTS acc_data_schema.takeoff_content_lineages;
CREATE TABLE acc_data_schema.takeoff_content_lineages (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "sheet_name"             varchar,
    "lineage_urn"            varchar,
    "view_name"              varchar,
    "type"                   varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: takeoff_packages
--
DROP TABLE IF EXISTS acc_data_schema.takeoff_packages;
CREATE TABLE acc_data_schema.takeoff_packages (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: takeoff_quantities
--
DROP TABLE IF EXISTS acc_data_schema.takeoff_quantities;
CREATE TABLE acc_data_schema.takeoff_quantities (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "quantity"               numeric,
    "output_name"            varchar,
    "unit_of_measure"        varchar,
    "quantity_order"         numeric,
    "item_id"                uuid,
    "classification1_id"     uuid,
    "classification2_id"     uuid,
    "carbon_definition_id"   uuid,
    "unit_cost"              numeric,
    "total_cost"             numeric
);

--
-- Table: takeoff_quantity_definitions
--
DROP TABLE IF EXISTS acc_data_schema.takeoff_quantity_definitions;
CREATE TABLE acc_data_schema.takeoff_quantity_definitions (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "output_name"            varchar,
    "expression"             varchar,
    "unit_of_measure"        varchar,
    "quantity_order"         numeric,
    "type_id"                uuid,
    "classification1_id"     uuid,
    "classification2_id"     uuid,
    "unit_cost"              numeric,
    "carbon_definition_id"   uuid
);

--
-- Table: takeoff_settings
--
DROP TABLE IF EXISTS acc_data_schema.takeoff_settings;
CREATE TABLE acc_data_schema.takeoff_settings (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "measurement_system"     varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: takeoff_takeoff_items
--
DROP TABLE IF EXISTS acc_data_schema.takeoff_takeoff_items;
CREATE TABLE acc_data_schema.takeoff_takeoff_items (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "content_lineage_id"     uuid,
    "content_version"        varchar,
    "package_id"             uuid,
    "type_id"                uuid,
    "object_name"            varchar,
    "location_id"            uuid,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: takeoff_takeoff_types
--
DROP TABLE IF EXISTS acc_data_schema.takeoff_takeoff_types;
CREATE TABLE acc_data_schema.takeoff_takeoff_types (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "name"                   varchar,
    "description"            varchar,
    "tool"                   varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "package_id"             uuid
);

-- =================================================================
-- # Schema: transmittals
-- =================================================================
--
-- Table: transmittals_transmittal_documents
--
DROP TABLE IF EXISTS acc_data_schema.transmittals_transmittal_documents;
CREATE TABLE acc_data_schema.transmittals_transmittal_documents (
    "id"                     uuid,
    "workflow_transmittal_id" uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "urn"                    varchar,
    "file_name"              varchar,
    "version_number"         numeric,
    "revision_number"        numeric,
    "parent_folder_urn"      varchar,
    "last_modified_time"     timestamp without time zone,
    "last_modified_user_id"  varchar,
    "last_modified_user_name" varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: transmittals_transmittal_non_members
--
DROP TABLE IF EXISTS acc_data_schema.transmittals_transmittal_non_members;
CREATE TABLE acc_data_schema.transmittals_transmittal_non_members (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "email"                  varchar,
    "first_name"             varchar,
    "last_name"              varchar,
    "company_name"           varchar,
    "role"                   varchar,
    "workflow_transmittal_id" uuid,
    "viewed_at"              timestamp without time zone,
    "downloaded_at"          timestamp without time zone,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone
);

--
-- Table: transmittals_transmittal_recipients
--
DROP TABLE IF EXISTS acc_data_schema.transmittals_transmittal_recipients;
CREATE TABLE acc_data_schema.transmittals_transmittal_recipients (
    "id"                     uuid,
    "workflow_transmittal_id" uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "user_id"                uuid,
    "user_name"              varchar,
    "email"                  varchar,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "company_name"           varchar,
    "viewed_at"              timestamp without time zone,
    "downloaded_at"          timestamp without time zone
);

--
-- Table: transmittals_workflow_transmittals
--
DROP TABLE IF EXISTS acc_data_schema.transmittals_workflow_transmittals;
CREATE TABLE acc_data_schema.transmittals_workflow_transmittals (
    "id"                     uuid,
    "bim360_account_id"      uuid,
    "bim360_project_id"      uuid,
    "sequence_id"            numeric,
    "title"                  varchar,
    "status"                 numeric,
    "create_user_id"         uuid,
    "create_user_name"       varchar,
    "docs_count"             numeric,
    "created_at"             timestamp without time zone,
    "updated_at"             timestamp without time zone,
    "create_user_company_id" varchar,
    "create_user_company_name" varchar
);

