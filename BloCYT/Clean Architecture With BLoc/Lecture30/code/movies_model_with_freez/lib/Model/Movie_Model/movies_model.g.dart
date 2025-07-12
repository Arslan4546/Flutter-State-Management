// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TvShows _$TvShowsFromJson(Map<String, dynamic> json) => _TvShows(
  name: json['name'] as String? ?? '',
  permalink: json['permalink'] as String? ?? '',
  endDate: json['endDate'] as String? ?? '',
  network: json['network'] as String? ?? '',
  imageThumbnailPath: json['imageThumbnailPath'] as String? ?? '',
  status: json['status'] as String? ?? '',
);

Map<String, dynamic> _$TvShowsToJson(_TvShows instance) => <String, dynamic>{
  'name': instance.name,
  'permalink': instance.permalink,
  'endDate': instance.endDate,
  'network': instance.network,
  'imageThumbnailPath': instance.imageThumbnailPath,
  'status': instance.status,
};
