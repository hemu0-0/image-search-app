import 'package:flutter/material.dart';

class NVBar extends StatelessWidget {
  final int index;
  final Function(int) onTap;

  const NVBar({super.key, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black12,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _navigationItem(
            icon: Icons.house,
            selectedIcon: Icons.house_outlined,
            label: '홈',
            currentIndex: 0,
          ),
          _navigationItem(
            icon: Icons.search,
            selectedIcon: Icons.search_outlined,
            label: '검색',
            currentIndex: 1,
          ),
          _navigationItem(
            icon: Icons.star,
            selectedIcon: Icons.star_border_outlined,
            label: '즐겨찾기',
            currentIndex: 2,
          ),
        ],
      ),
    );
  }

  Widget _navigationItem({
    required IconData icon,
    required IconData selectedIcon,
    required String label,
    required int currentIndex,
  }) {
    final bool isSelected = index == currentIndex;
    final color = isSelected ? Colors.deepPurple : Colors.grey;

    return Expanded(
      child: InkWell(
        onTap: () => onTap(currentIndex),
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(isSelected ? icon : selectedIcon, color: color),
              const SizedBox(height: 4),
              Text(label, style: TextStyle(fontSize: 12, color: color)),
            ],
          ),
        ),
      ),
    );
  }
}
