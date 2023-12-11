import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/support/data/model/support_model.dart';
import 'package:progresscenter_app_v4/src/feature/support/data/model/ticket_by_id_model.dart';
import 'package:progresscenter_app_v4/src/feature/support/data/model/ticket_replies_model.dart';

abstract class SupportRepository {
  Future<Either<Failure, List<SupportModel>>> supportList();
  Future<Either<Failure, dynamic>> createTicket(data);
  Future<Either<Failure, TicketByIdModel>> ticketBYId(String ticketId);
  Future<Either<Failure, List<TicketRepliesModel>>> ticketReplies(String ticketId);
}
