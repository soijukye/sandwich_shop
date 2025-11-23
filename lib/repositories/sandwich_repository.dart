import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/sandwich.dart';

class SandwichRepository {
	List<Sandwich>? _cache;

	Future<List<Sandwich>> getAllSandwiches() async {
		if (_cache != null) return _cache!;
		final String jsonString = await rootBundle.loadString('assets/sandwiches.json');
		final Map<String, dynamic> jsonData = json.decode(jsonString);
		final sandwiches = (jsonData['sandwiches'] as List)
				.map((item) => Sandwich.fromJson(item as Map<String, dynamic>))
				.toList();
		_cache = sandwiches;
		return sandwiches;
	}

	Future<Sandwich?> getSandwichById(String id) async {
		final sandwiches = await getAllSandwiches();
		try {
			return sandwiches.firstWhere((sandwich) => sandwich.id == id);
		} catch (e) {
			return null;
		}
	}
}


