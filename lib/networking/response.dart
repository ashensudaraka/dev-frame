class Response<T> {
  Status status;
  T data;
  String message;

  Response.loading(this.message) : status = Status.LOADING;
  Response.completed(this.data) : status = Status.COMPLETED;
  Response.error(this.message) : status = Status.ERROR;

  Response.fromJson(x);

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

class ResponseList<T> {
  Status status;
  List<T> data;
  String message;

  ResponseList.loading(this.message) : status = Status.LOADING;
  ResponseList.completed(this.data) : status = Status.COMPLETED;
  ResponseList.error(this.message) : status = Status.ERROR;

  ResponseList.fromJson(x);

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR }


