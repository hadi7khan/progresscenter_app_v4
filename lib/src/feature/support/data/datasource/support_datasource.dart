import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/common/data/exception.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_client.dart';
import 'package:progresscenter_app_v4/src/core/providers/dio_provider.dart';

final supportDataSourceProvider =
    Provider.autoDispose<SupportDataSource>((ref) {
  return SupportDataSourceImpl(dioClient: ref.watch(dioClientProvider));
});

abstract class SupportDataSource {
  Future supportList({searchText = ''});
  Future createTicket(data);
  Future ticketById(ticketId);
  Future ticketReplies(ticketId);
  Future postTicketReply(ticketId, data);
}

class SupportDataSourceImpl implements SupportDataSource {
  final DioClient dioClient;
  SupportDataSourceImpl({
    required this.dioClient,
  });

  @override
  Future supportList({searchText = ''}) async {
    final response = await dioClient.get(Endpoints.supportListUrl());
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }

  @override
  Future createTicket(data) async {
    final response =
        await dioClient.post(Endpoints.supportListUrl(), data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }

  @override
  Future ticketById(ticketId) async {
    final response = await dioClient.get(Endpoints.ticketByIdUrl(ticketId));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }

  @override
  Future ticketReplies(ticketId) async {
    final response = await dioClient.get(Endpoints.ticketRepliesUrl(ticketId));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }

  @override
  Future postTicketReply(ticketId, data) async {
    final response =
        await dioClient.post(Endpoints.ticketRepliesUrl(ticketId), data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }
}
