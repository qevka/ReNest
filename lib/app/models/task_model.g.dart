// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      name: json['name'] as String,
      done: json['done'] as bool,
      priority: $enumDecode(_$PriorityEnumMap, json['priority']),
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'name': instance.name,
      'done': instance.done,
      'priority': _$PriorityEnumMap[instance.priority],
    };

const _$PriorityEnumMap = {
  Priority.high: 'high',
  Priority.normal: 'normal',
  Priority.low: 'low',
};
