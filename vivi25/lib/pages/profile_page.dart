import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../components/score_entry.dart';
import '../components/subscription_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _showFullScoreboard = false;

  final List<FlSpot> _ratingSpots = [
    FlSpot(0, 2400),
    FlSpot(1, 2600),
    FlSpot(2, 2700),
    FlSpot(3, 2650),
    FlSpot(4, 2550),
    FlSpot(5, 2450),
    FlSpot(6, 2300),
    FlSpot(7, 2350),
    FlSpot(8, 2500),
    FlSpot(9, 2700),
    FlSpot(10, 2800),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Profile', style: TextStyle(color: Color(0xFFFFC107))),
        backgroundColor: const Color(0xFF0F1C2E),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Subscription Model',
                style: TextStyle(
                    color: Color(0xFFF5F6F5),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Card(
                color: const Color(0xFF4A6B6F),
                child: ListTile(
                  title: const Text('Basic Plan',
                      style: TextStyle(color: Color(0xFFF5F6F5))),
                  subtitle: const Text('Free with limited features.',
                      style: TextStyle(color: Color(0xFFF5F6F5))),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00A86B)),
                    child: const Text('Select',
                        style: TextStyle(color: Color(0xFFF5F6F5))),
                  ),
                ),
              ),
              Card(
                color: const Color(0xFF4A6B6F),
                child: ListTile(
                  title: const Text('Premium Plan',
                      style: TextStyle(color: Color(0xFFF5F6F5))),
                  subtitle: const Text('₹499/month with full access.',
                      style: TextStyle(color: Color(0xFFF5F6F5))),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00A86B)),
                    child: const Text('Subscribe',
                        style: TextStyle(color: Color(0xFFF5F6F5))),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Rating Growth',
                style: TextStyle(
                    color: Color(0xFFF5F6F5),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                height: 200,
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: const Color(0xFF1E2A44),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: true,
                          horizontalInterval: 500,
                          verticalInterval: 1,
                          getDrawingHorizontalLine: (value) {
                            return FlLine(
                              color: Colors.white.withOpacity(0.2),
                              strokeWidth: 1,
                            );
                          },
                          getDrawingVerticalLine: (value) {
                            return FlLine(
                              color: Colors.white.withOpacity(0.2),
                              strokeWidth: 1,
                            );
                          },
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 22,
                              getTitlesWidget: (value, meta) {
                                switch (value.toInt()) {
                                  case 0:
                                    return const Text('Mar 2024',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10));
                                  case 3:
                                    return const Text('Jun 2024',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10));
                                  case 6:
                                    return const Text('Sep 2024',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10));
                                  case 9:
                                    return const Text('Dec 2024',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10));
                                  case 10:
                                    return const Text('Jan 2025',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10));
                                  default:
                                    return const Text('');
                                }
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 28,
                              interval: 500,
                              getTitlesWidget: (value, meta) {
                                if (value % 500 == 0) {
                                  return Text(value.toInt().toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 10));
                                }
                                return const Text('');
                              },
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border:
                              Border.all(color: Colors.white.withOpacity(0.2)),
                        ),
                        minX: 0,
                        maxX: 10,
                        minY: 2000,
                        maxY: 3000,
                        lineBarsData: [
                          LineChartBarData(
                            spots: _ratingSpots,
                            isCurved: false,
                            color: Colors.purple,
                            barWidth: 2,
                            dotData: FlDotData(show: true),
                            belowBarData: BarAreaData(show: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Scoreboard',
                style: TextStyle(
                    color: Color(0xFFF5F6F5),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Card(
                color: _showFullScoreboard
                    ? const Color(0xFF1E2A44)
                    : const Color(0xFF4A6B6F),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _showFullScoreboard = !_showFullScoreboard;
                    });
                  },
                  child: _showFullScoreboard
                      ? Column(
                          children: [
                            _buildScoreEntry('You', '6441', 24197),
                            _buildScoreEntry('Player 2', '200', 2),
                            _buildScoreEntry('Player 3', '180', 3),
                            _buildScoreEntry('Player 4', '150', 4),
                            _buildScoreEntry('Player 5', '120', 5),
                          ],
                        )
                      : _buildScoreEntry('You', '6441', 24197),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScoreEntry(String name, String score, int rank) {
    return ListTile(
      leading: Text('$rank', style: const TextStyle(color: Color(0xFFF5F6F5))),
      title: Text(name, style: const TextStyle(color: Color(0xFFF5F6F5))),
      trailing: Text(score, style: const TextStyle(color: Color(0xFFF5F6F5))),
    );
  }
}
