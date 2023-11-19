class TypebotInputDTO {
  TypebotInputDTO();

  factory TypebotInputDTO.fromDTO(Map<String, dynamic> map) {
    return TypebotInputDTO();
  }
}

class TypebotMessageDTO {
  TypebotMessageDTO();

  factory TypebotMessageDTO.fromDTO(Map<String, dynamic> map) {
    return TypebotMessageDTO();
  }
}

class TypebotResponseDTO {
  final String sessionId;
  final List<TypebotMessageDTO> messsages;
  final TypebotInputDTO input;

  TypebotResponseDTO({required this.sessionId, required this.messsages, required this.input});

  factory TypebotResponseDTO.fromMap(Map<String, dynamic> map) {
    return TypebotResponseDTO(
      sessionId: map['sessionId'],
      messsages: List.from(map['messsages']).map((e) => TypebotMessageDTO.fromDTO(e)).toList(),
      input: TypebotInputDTO.fromDTO(map['input']),
    );
  }
}
