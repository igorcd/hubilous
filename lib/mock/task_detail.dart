import 'package:aubilous/core/models/attachment_model.dart';
import 'package:aubilous/core/models/task_detail_model.dart';
import 'package:aubilous/core/models/todo_model.dart';

TaskDetailModel taskDetail = TaskDetailModel(
  completed: false,
  title: "Issue your working Visa",
  description:
      "Conforme combinado, envio em anexo a Checklist dos Documentos Gerais para o Pedido de Concessão do teu Visto de Residência (Visto de Residência para exercício de atividade profissional independente (D2) – artigo 60.º da Lei de Estrangeiros) para começares a recolher a tua documentação.Deverás enviar o teu pedido de visto por correios (devido à atual pandemia) para a VFS de Salvador.",
  images: ["https://upload.wikimedia.org/wikipedia/commons/d/d7/VFS_Global_Logo.png"],
  toDoTitle: "Documentos necessários",
  toDos: [
    TodoModel(title: "Formulário VFS", checked: false),
    TodoModel(title: "Declaração de que não deve viajar sem visto", checked: false),
    TodoModel(title: "Autorização consulta registro criminal", checked: false),
    TodoModel(title: "Declaração do próprio", checked: false),
    TodoModel(title: "Contrato-Prmessa de prestação de serviços", checked: false),
  ],
  attachments: [
    AttachmentModel(
      name: "Lista D2 - VFS.docx",
      extension: "DOCX",
      size: 16,
    ),
    AttachmentModel(
      name: "Formulário VFS_pt.pdf",
      extension: "PDF",
      size: 110,
    ),
    AttachmentModel(
      name: "Declaração de que não deve viajar sem visto.docx",
      extension: "DOCX",
      size: 13,
    ),
    AttachmentModel(
      name: "Autorização consulta registro criminal.docx",
      extension: "DOCX",
      size: 13,
    ),
    AttachmentModel(
      name: "Declaração de próprio - motivos de pedido de visto.docx",
      extension: "DOCX",
      size: 14,
    ),
    AttachmentModel(
      name: "Instruções Formulário VFS.pdf",
      extension: "PDF",
      size: 129,
    ),
    AttachmentModel(
      name: "Contrato-Promessa de prestação de serviços.pdf",
      extension: "PDF",
      size: 920,
    ),
  ],
);
