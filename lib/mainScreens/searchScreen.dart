import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SearchScreen extends SearchDelegate<String> {
  final List<String> _words;
  List<String> _history = [];

  void addToHistory(List<String> history) async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('searchHistory')) {
      final historyData = json.encode(
        {
          'data': history,
        },
      );
      prefs.setString('searchHistory', historyData);
    }
  }

  void fetchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('searchHistory')) {
      return null;
    }
    final responseData =
        json.decode(prefs.getString('searchHistory')) as Map<String, dynamic>;
    final List<String> loadedItems = [];
    responseData['data'].forEach((itemData) {
      loadedItems.add(itemData);
    });
    _history = loadedItems;
  }

  SearchScreen(List<String> words)
      : _words = words,
        super();

  @override
  Widget buildLeading(BuildContext context) {
    fetchHistory();
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        this.close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('You have selected the word:'),
            GestureDetector(
              onTap: () {
                this.close(context, this.query);
              },
              child: Text(
                this.query,
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions = this.query.isEmpty
        ? _history
        : _words.where((word) => word.startsWith(query));

    return _SuggestionList(
      query: this.query,
      suggestions: suggestions == null ? [] : suggestions.toList(),
      onSelected: (String suggestion) async {
        this.query = suggestion;
        this._history.add(suggestion);
        addToHistory(_history);
        showResults(context);
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      query.isEmpty
          ? new Container()
          : IconButton(
              tooltip: 'Clear',
              icon: const Icon(Icons.clear),
              onPressed: () {
                query = '';
                showSuggestions(context);
              },
            ),
    ];
  }
}

class _SuggestionList extends StatelessWidget {
  const _SuggestionList({
    this.suggestions,
    this.query,
    this.onSelected,
  });

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion = suggestions[i];
        return ListTile(
          leading: query.isEmpty ? Icon(Icons.history) : Icon(null),
          // Highlight the substring that matched the query.
          title: RichText(
            text: TextSpan(
              text: suggestion.substring(0, query.length),
              style: textTheme.copyWith(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: suggestion.substring(query.length),
                  style: textTheme,
                ),
              ],
            ),
          ),
          onTap: () {
            onSelected(suggestion);
          },
        );
      },
    );
  }
}
