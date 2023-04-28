import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:guia_de_valorant/network/api/api_service.dart';
import 'package:guia_de_valorant/models/agent_model.dart';

class AgentsScreen extends StatefulWidget {
  @override
  _AgentsScreenState createState() => _AgentsScreenState();
}

class _AgentsScreenState extends State<AgentsScreen> {
  late List<Agent> agents;

  @override
  void initState() {
    super.initState();
    agents = [];
    fetchAgents();
  }

  Future<void> fetchAgents() async {
    final api = Api();
    final agents = await api.getAgents();
    setState(() {
      this.agents = agents.map((json) => Agent.fromJson(json)).toList();
    });
  }

  Widget _buildCard(Agent agent) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.white, Color(0xFF6769CA)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                agent.fullPortrait,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              agent.displayName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agents"),
        backgroundColor: const Color(0xFF0F1923),
      ),
      body: agents == null
          ? const Center(child: CircularProgressIndicator())
          : agents.isEmpty
              ? const Center(
                  child: Text(
                    "No agents available",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                )
              : GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  padding: const EdgeInsets.all(16),
                  children: agents.map((agent) => _buildCard(agent)).toList(),
                ),
      backgroundColor: const Color(0xFF0F1923),
    );
  }
}
