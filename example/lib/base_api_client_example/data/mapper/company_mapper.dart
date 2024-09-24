import 'package:example/base_api_client_example/data/model/company_model.dart';
import 'package:example/base_api_client_example/domain/entity/company_entity.dart';
import 'package:onix_flutter_core/onix_flutter_core.dart';

class CompanyMapper implements Mapper<CompanyModel, CompanyEntity> {
  @override
  CompanyEntity map(CompanyModel from) {
    return CompanyEntity(
      name: from.name ?? '',
      catchPhrase: from.catchPhrase ?? '',
      bs: from.bs ?? '',
    );
  }
}
