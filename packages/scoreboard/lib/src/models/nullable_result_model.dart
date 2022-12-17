class NullableResultModel extends Comparable{
  int position;
  String? hostel;
  int? points;
  int? primaryScore;
  int? secondaryScore;
  NullableResultModel({required this.position});

  @override
  int compareTo(other) {
    return position.compareTo(other.position);
  }
  
}