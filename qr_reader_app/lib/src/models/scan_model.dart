
class ScanModel {

    int id;
    String type;
    String value;

    ScanModel({
        this.id,
        this.type,
        this.value,
    });

    factory ScanModel.fromJson(Map<String, dynamic> json) => new ScanModel(
        id    : json["id"],
        type  : json["type"],
        value : json["value"],
    );

    Map<String, dynamic> toJson() => {
        "id"    : id,
        "type"  : type,
        "value" : value,
    };
}