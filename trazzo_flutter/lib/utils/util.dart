import 'package:flutter/material.dart';



class TituloSeccion extends StatelessWidget {
  const TituloSeccion(this.texto, {super.key, this.style});
  final String texto;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) => Text(texto, style: style);
}

class LogoTrazzo extends StatelessWidget {
  const LogoTrazzo({super.key, this.alto = 70});
  final double alto;

  @override
  Widget build(BuildContext context) =>
      Image.asset("assets/images/trazzo.png", height: alto, fit: BoxFit.contain);
}

class BotonApp extends StatelessWidget {
  const BotonApp({
    super.key,
    required this.texto,
    required this.onPressed,
    this.alto = 56,
    this.ancho,
    this.backgroundColor,
    this.textStyle,
    this.borderRadius = 30,
  });

  final String texto;
  final VoidCallback onPressed;
  final double alto;
  final double? ancho;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ancho ?? double.infinity,
      height: alto,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(texto, style: textStyle),
      ),
    );
  }
}

class DivisorConTexto extends StatelessWidget {
  const DivisorConTexto({
    super.key,
    required this.texto,
    this.color,
    this.textStyle,
  });

  final String texto;
  final Color? color;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final c = color ?? Colors.grey;
    return Row(
      children: [
        Expanded(child: Divider(height: 1, thickness: 1, color: c)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(texto, style: textStyle ?? TextStyle(color: c)),
        ),
        Expanded(child: Divider(height: 1, thickness: 1, color: c)),
      ],
    );
  }
}

class BotonGoogle extends StatelessWidget {
  const BotonGoogle({
    super.key,
    required this.onPressed,
    this.texto = 'Continuar con Google',
    this.alto = 56,
    this.ancho,
    this.backgroundColor,
    this.textStyle,
    this.borderRadius = 12,
    this.logoSize = 24,
  });

  final VoidCallback onPressed;
  final String texto;
  final double alto;
  final double? ancho;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final double borderRadius;
  final double logoSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius),
      onTap: onPressed,
      child: Container(
        height: alto,
        width: ancho ?? double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/google_logo.png', width: logoSize, height: logoSize),
            const SizedBox(width: 10),
            Text(texto, style: textStyle),
          ],
        ),
      ),
    );
  }
}


class ChipInteres extends StatelessWidget {
  const ChipInteres({
    super.key,
    required this.texto,
    required this.seleccionado,
    required this.onTap,
    this.bg,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
    this.borderRadius = 999,
  });

  final String texto;
  final bool seleccionado;
  final VoidCallback onTap;
  final Color? bg;
  final TextStyle? textStyle;
  final EdgeInsets padding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final color = bg;
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius),
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Text(texto, style: textStyle),
      ),
    );
  }
}


class CampoIconoEtiqueta extends StatefulWidget {
  const CampoIconoEtiqueta({
    super.key,
    required this.icono,
    required this.etiqueta,
    required this.hint,
    this.controller,
    this.valor,
    this.onChanged,
    this.esPassword = false,
    this.teclado,
    this.maxLineas = 1,
    this.borderRadius = 26,
    this.inputDecoration,
    this.labelStyle,
    this.iconColor,
  });

  final IconData icono;
  final String etiqueta;
  final String hint;
  final TextEditingController? controller;
  final String? valor;
  final ValueChanged<String>? onChanged;
  final bool esPassword;
  final TextInputType? teclado;
  final int maxLineas;
  final double borderRadius;
  final InputDecoration? inputDecoration;
  final TextStyle? labelStyle;
  final Color? iconColor;

  @override
  State<CampoIconoEtiqueta> createState() => _CampoIconoEtiquetaState();
}

class _CampoIconoEtiquetaState extends State<CampoIconoEtiqueta> {
  late final TextEditingController _ctrl;
  bool _own = false;
  bool _obscure = false;

  @override
  void initState() {
    super.initState();
    _obscure = widget.esPassword;
    if (widget.controller != null) {
      _ctrl = widget.controller!;
    } else {
      _own = true;
      _ctrl = TextEditingController(text: widget.valor ?? '');
    }
  }

  @override
  void didUpdateWidget(covariant CampoIconoEtiqueta oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_own && widget.valor != null && widget.valor != _ctrl.text) {
      _ctrl.value = TextEditingValue(
        text: widget.valor!,
        selection: TextSelection.collapsed(offset: widget.valor!.length),
      );
    }
  }

  @override
  void dispose() {
    if (_own) _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final label = Row(
      children: [
        Icon(widget.icono, size: 18, color: widget.iconColor),
        const SizedBox(width: 6),
        Text(widget.etiqueta, style: widget.labelStyle),
      ],
    );

    final baseDecoration = InputDecoration(
      hintText: widget.hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label,
        TextField(
          controller: _ctrl,
          onChanged: widget.onChanged,
          obscureText: _obscure,
          keyboardType: widget.teclado,
          maxLines: widget.esPassword ? 1 : widget.maxLineas,
          decoration: widget.inputDecoration ?? baseDecoration,
        ),
      ],
    );
  }
}