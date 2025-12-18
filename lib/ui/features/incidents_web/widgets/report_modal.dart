/*
import 'package:Nexus/ui/core/modal/custom_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReportModal extends StatefulWidget {
  const ReportModal({super.key});

  @override
  State<ReportModal> createState() => _ReportModalState();
}

class _ReportModalState extends State<ReportModal> {
  final _formKey = GlobalKey<FormState>();

  // Instanciando o Modelo Mutável e o Validador
  late final AccessLogReportModel _model;
  late final AccessLogReportValidator _validator;

  // Focus Nodes para navegação
  late final FocusNode _startDateFocus;
  late final FocusNode _endDateFocus;

  // Controllers para gerenciar o texto da máscara
  late final TextEditingController _startController;
  late final TextEditingController _endController;

  @override
  void initState() {
    super.initState();
    _model = AccessLogReportModel.empty();
    _validator = AccessLogReportValidator();

    _startDateFocus = FocusNode();
    _endDateFocus = FocusNode();

    _startController = TextEditingController();
    _endController = TextEditingController();
  }

  @override
  void dispose() {
    _startDateFocus.dispose();
    _endDateFocus.dispose();
    _startController.dispose();
    _endController.dispose();
    super.dispose();
  }

  // Helper para converter String (dd/MM/yyyy) -> DateTime no Modelo
  void _parseAndSetDate(String value, Function(DateTime?) setDate) {
    if (value.length != 10) {
      // Se não tem o tamanho completo, seta nulo para falhar na validação de isNotNull
      setDate(null);
      return;
    }

    try {
      final parts = value.split('/');
      if (parts.length == 3) {
        final day = int.parse(parts[0]);
        final month = int.parse(parts[1]);
        final year = int.parse(parts[2]);

        // Cria a data e atualiza o modelo
        final date = DateTime(year, month, day);
        setDate(date);
      }
    } catch (_) {
      setDate(null);
    }
  }

  void _submit() {
    // Valida o formulário visualmente
    if (_formKey.currentState?.validate() ?? false) {
      try {
        // Converte para o DTO imutável (Request)
        final request = _model.toRequest();

        // Retorna o request para quem abriu o modal (ou chama o repository aqui)
        Navigator.of(context).pop(request);

        // Exemplo de log para debug
        print('Gerando relatório de ${request.startDate} até ${request.endDate}');
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao preparar dados: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateMaskFormatter = _DateTextFormatter();
    return ListenableBuilder(
      listenable: Listenable.merge([_startController, _endController]),
      builder: (context, _) {
        return CustomModal(
          title: 'Gerar relatórios',
          primaryActionButton: FilledButton(
            onPressed: _submit,
            child: const Text('Gerar'),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // --- Data Inicial ---
                TextFormField(
                  controller: _startController,
                  focusNode: _startDateFocus,
                  keyboardType: TextInputType.number,
                  // Máscara e Filtro de digitos
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    dateMaskFormatter,
                    LengthLimitingTextInputFormatter(10), // 10 caracteres: dd/mm/aaaa
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Data Inicial',
                    hintText: 'dd/mm/aaaa',
                    prefixIcon: Icon(Icons.calendar_today_outlined),
                    border: OutlineInputBorder(),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  // Lógica de Atualização do Modelo
                  onChanged: (value) => _parseAndSetDate(
                      value,
                      _model.setStartDate
                  ),

                  // Avança para o próximo campo
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_endDateFocus),

                  // Validador conectado ao Modelo e ao LucidValidator
                  validator: (value) {
                    // O validator.byField retorna uma função que valida o modelo atual
                    return _validator.byField(_model, 'startDate')(value);
                  },
                ),

                const SizedBox(height: 16),

                // --- Data Final ---
                TextFormField(
                  controller: _endController,
                  focusNode: _endDateFocus,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    dateMaskFormatter,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Data Final',
                    hintText: 'dd/mm/aaaa',
                    prefixIcon: Icon(Icons.event_busy_outlined),
                    border: OutlineInputBorder(),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  // Lógica de Atualização do Modelo
                  onChanged: (value) => _parseAndSetDate(
                      value,
                      _model.setEndDate
                  ),

                  validator: (value) {
                    return _validator.byField(_model, 'endDate')(value);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DateTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {

    // Se estiver apagando, permite livremente
    if (newValue.text.length < oldValue.text.length) {
      return newValue;
    }

    var text = newValue.text;

    // Adiciona a primeira barra
    if (text.length >= 2 && !text.contains('/')) {
      text = '${text.substring(0, 2)}/${text.substring(2)}';
    }
    // Adiciona a segunda barra
    if (text.length >= 5 && text.substring(0, 5).split('/').length < 3) {
      // Pequena lógica para garantir que a segunda barra entre na posição certa
      // Se o usuario digitou rapido "1212", vira "12/12"
      // Se digitou "12122", vira "12/12/2"
      if (!text.substring(3).contains('/')) {
        text = '${text.substring(0, 5)}/${text.substring(5)}';
      }
    }
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}*/
