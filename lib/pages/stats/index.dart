import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todayLabel = DateFormat('MMMM d, y').format(DateTime.now());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Statistics',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  todayLabel,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 18),
                _RangeTabs(selected: _StatsRange.week, onChanged: (_) {}),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: const Color(0xFF0D0F12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: Image.asset(
                      'assets/img/cal-graph.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: const [
                //     _MiniStat(value: '8.42', label: 'Active Time'),
                //     _MiniStat(value: '1,540', label: 'Sessions'),
                //     _MiniStat(value: '3:24', label: 'Distance'),
                //   ],
                // ),
                // const SizedBox(height: 22),
                const Text(
                  'Day plan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: const [
                    Expanded(
                      child: _PlanCard(
                        icon: Icons.bar_chart,
                        title: 'Recovery',
                        subtitle: '7.5 hours',
                      ),
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: _PlanCard(
                        icon: Icons.fitness_center,
                        title: 'Training',
                        subtitle: '3 hours',
                      ),
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: _PlanCard(
                        icon: Icons.directions_run,
                        title: 'Jogging',
                        subtitle: '13 km',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum _StatsRange { day, week, month, year }

class _RangeTabs extends StatelessWidget {
  const _RangeTabs({required this.selected, required this.onChanged});

  final _StatsRange selected;
  final ValueChanged<_StatsRange> onChanged;

  @override
  Widget build(BuildContext context) {
    Widget tab(String text, _StatsRange value) {
      final isSelected = selected == value;
      return GestureDetector(
        onTap: () => onChanged(value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF00C2FF) : Colors.transparent,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: isSelected ? Colors.black : Colors.white70,
            ),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        tab('Day', _StatsRange.day),
        tab('Week', _StatsRange.week),
        tab('Month', _StatsRange.month),
        tab('Year', _StatsRange.year),
      ],
    );
  }
}

// class _MiniStat extends StatelessWidget {
//   const _MiniStat({required this.value, required this.label});

//   final String value;
//   final String label;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           value,
//           style: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w900,
//             color: Colors.white,
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.w700,
//             color: Color(0xFFFF3B30),
//           ),
//         ),
//       ],
//     );
//   }
// }

class _PlanCard extends StatelessWidget {
  const _PlanCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D22),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 26, color: const Color(0xFF00C2FF)),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Colors.white60,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
