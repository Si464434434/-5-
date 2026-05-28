 class Solution {
public:

    struct Node {
        int bestIdx;
        int child[26];

        Node() {
            bestIdx = -1;
            for (int i = 0; i < 26; i++)
                child[i] = -1;
        }
    };

    vector<Node> trie;

    vector<string>* words;

    void updateBest(int node, int idx) {
        if (trie[node].bestIdx == -1) {
            trie[node].bestIdx = idx;
            return;
        }

        int a = trie[node].bestIdx;
        int b = idx;

        if ((*words)[b].size() < (*words)[a].size() ||
           ((*words)[b].size() == (*words)[a].size() && b < a)) {
            trie[node].bestIdx = b;
        }
    }

    void insert(string &s, int idx) {
        int node = 0;

        updateBest(node, idx);

        for (char c : s) {
            int ch = c - 'a';

            if (trie[node].child[ch] == -1) {
                trie[node].child[ch] = trie.size();
                trie.push_back(Node());
            }

            node = trie[node].child[ch];
            updateBest(node, idx);
        }
    }

    int search(string &s) {
        int node = 0;
        int ans = trie[node].bestIdx;

        for (char c : s) {
            int ch = c - 'a';

            if (trie[node].child[ch] == -1)
                break;

            node = trie[node].child[ch];
            ans = trie[node].bestIdx;
        }

        return ans;
    }

    vector<int> stringIndices(vector<string>& wordsContainer, vector<string>& wordsQuery) {
        words = &wordsContainer;

        trie.clear();
        trie.push_back(Node()); // root

        int n = wordsContainer.size();

        for (int i = 0; i < n; i++) {
            string s = wordsContainer[i];
            reverse(s.begin(), s.end());
            insert(s, i);
        }

        vector<int> ans;

        for (auto &q : wordsQuery) {
            string s = q;
            reverse(s.begin(), s.end());
            ans.push_back(search(s));
        }

        return ans;
    }
};
