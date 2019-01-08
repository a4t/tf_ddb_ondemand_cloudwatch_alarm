# tf_ddb_ondemand_cloudwatch_alarm

tf_ddb_ondemand_cloudwatch_alarm is Terraform module.

## Description
This module Create CloudWatch Alarm for DynamoDB on-demand.

- ConsumedReadCapacityUnits (Sum)
- ConsumedWriteCapacityUnits (Sum)

## Module Input Variables

### Required

- `table_name` - DynamoDB table name (String)
- `read_threshold` - Read Capacity Units threshold value (Integer)
- `write_threshold` - Write Capacity Units threshold value (Integer)

### Optional
- `alarm_prefix` - CloudWatch alarm prefix name (String)
- `alarm_actions` - alarm actions arn (List)
- `read_evaluation_periods` - Read evaluation periods (Integer)
- `read_period` - Read period (Integer)
- `write_evaluation_periods` - Write evaluation periods (Integer)
- `write_period` - Write period (Integer)
- `gsi` - Global Secondary Index alarms (List)

### gsi list options
#### Required

- `name` - Global Secondary Index Name(String)
- `read_period` - GSI Read period (Integer)
- `read_evaluation_periods` - GSI Read evaluation periods (Integer)
- `read_threshold` - GSI Read Capacity Units threshold value (Integer)
- `write_period` - GSI Write period(Integer)
- `write_evaluation_periods` - GSI Write evaluation periods (Integer)
- `write_threshold` - GSI Write Capacity Units threshold value (Integer)

## Usage

### Basic

```
module ddb_ondemand_cloudwatch_alarm {
  source          = "github.com/a4t/tf_ddb_ondemand_cloudwatch_alarm"
  table_name      = "sample_table"
  read_threshold  = 60
  write_threshold = 60
}
```

### All Options

```
module ddb_ondemand_cloudwatch_alarm {
  source          = "github.com/a4t/tf_ddb_ondemand_cloudwatch_alarm"
  table_name      = "sample_table"
  read_threshold  = 60
  write_threshold = 60

  alarm_prefix = "dynamodb-alarm"
  alarm_actions = [
    "arn:aws:sns:ap-northeast-1:123456789012:abcdefghij"
  ]

  read_evaluation_periods  = 5
  read_period              = 300
  write_evaluation_periods = 5
  write_period             = 300

  gsi = [
    {
      name                     = "index_name1"
      read_period              = 60
      read_evaluation_periods  = 1
      read_threshold           = 100
      write_period             = 60
      write_evaluation_periods = 1
      write_threshold          = 100
    },
    {
      name                     = "index_name2"
      read_period              = 60
      read_evaluation_periods  = 1
      read_threshold           = 200
      write_period             = 60
      write_evaluation_periods = 1
      write_threshold          = 200
    }
  ]
}
```
