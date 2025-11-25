import 'package:flutter/material.dart';

class CustomDropdownChip<T> extends StatelessWidget {
  final List<T> items;
  final T? selected;
  final void Function(T?) onSelected;
  final String placeholder;
  final String Function(T item) labelBuilder;

  const CustomDropdownChip({
    super.key,
    required this.items,
    required this.onSelected,
    required this.labelBuilder,
    this.selected,
    this.placeholder = "Selecionar",
  });

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      menuChildren: items.map((item) {
        return MenuItemButton(
          onPressed: () {
            onSelected(item);
          },
          child: Text(labelBuilder(item)),
        );
      }).toList(),
      builder: (context, controller, child) {
        return InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: (){
            if(controller.isOpen){
              controller.close();
            }else{
              controller.open();
            }
          },
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context)
                    .colorScheme
                    .outline
                    .withValues(alpha: 0.8),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5,right: 8),
            child: Row(
              spacing: 5,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.arrow_drop_down_outlined, size: 20,),
                Text(selected == null ? placeholder : labelBuilder(selected!)),
                if(selected != null)
                IconButton(
                  onPressed: () => onSelected(null),
                  icon: const Icon(Icons.close),
                  iconSize: 20,
                  style: IconButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}