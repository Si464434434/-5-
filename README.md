🏆 Consistency creates results. Results create confidence.

Excited to receive the certificate for successfully completing the GeeksforGeeks 60 Days POTD Challenge 🚀💻

For the past 60+ days, I’ve been consistently solving problems, improving my DSA skills, and pushing myself to learn something new every single day.

This journey taught me:#includ#include <bits/stdc++.h><img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/5736da64-f23a-437a-ae92-1d359068e9c4" />

using namespace std;

class Solution {
public:
    int minToggle(vector<int>& arr) {
        int n = arr.size();
        int totalOnes = 0;
        for (int x : arr) if (x == 1) totalOnes++;

        int leftOnes = 0, ans = INT_MAX;
        for (int i = 0; i <= n; i++) {
            // left side: ones to flip → 0
            // right side: zeros to flip → 1
            int rightZeros = (n - i) - (totalOnes - leftOnes);
            ans = min(ans, leftOnes + rightZeros);

            if (i < n && arr[i] == 1) leftOnes++;
        }
        return ans;
    }
};
e <bits/stdc++.h>
using namespace std;

class Solution {
public:
    int cntOnes(vector<vector<int>>& grid) {
        int n = grid.size(), m = grid[0].size();
        vector<vector<int>> vis(n, vector<int>(m, 0));
        queue<pair<int,int>> q;

        // Step 1: Add boundary 1s to queue
        for (int i = 0; i < n; i++) {
            for (int j : {0, m-1}) {
                if (grid[i][j] == 1 && !vis[i][j]) {
                    q.push({i,j});
                    vis[i][j] = 1;
                }
            }
        }
        for (int j = 0; j < m; j++) {
            for (int i : {0, n-1}) {
                if (grid[i][j] == 1 && !vis[i][j]) {
                    q.push({i,j});
                    vis[i][j] = 1;
                }
            }
        }

        // Directions: up, down, left, right
        int dx[4] = {-1,1,0,0};
        int dy[4] = {0,0,-1,1};

        // Step 2: BFS to mark all connected 1s
        while (!q.empty()) {
            auto [x,y] = q.front(); q.pop();
            for (int d = 0; d < 4; d++) {
                int nx = x + dx[d], ny = y + dy[d];
                if (nx>=0 && nx<n && ny>=0 && ny<m && grid[nx][ny]==1 && !vis[nx][ny]) {
                    vis[nx][ny] = 1;
                    q.push({nx,ny});
                }
            }
        }

        // Step 3: Count unvisited 1s
        int count = 0;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (grid[i][j] == 1 && !vis[i][j]) count++;
            }
        }
        return count;
    }
};

✅ Discipline matters more than motivation
✅ Small daily improvements compound over time vbvn 
✅ Consistency is the real game changer

Grateful to GeeksforGeeks for creating such an amazing learning platform and challenge experience.

Now aiming for even bigger milestones ahead 🔥

#GeeksforGeeks #GFG #DSA #Coding #Programming #ProblemSolving #CompetitiveProgramming #Cpp #Developer #Learning #Consistency #CodingJourney #StudentDeveloper #100DaysOfCode# -5-class Solution {
  public:
  
    int minSteps(vector<int>& arr, int start, int end) {
        
        if(start == end) return 0;
        
        vector<int> dist(1000, 1e9);
        queue<pair<int,int>> q;
        
        q.push({start, 0});
        dist[start] = 0;
        
        while(!q.empty()) {
            int node = q.front().first;
            int steps = q.front().second;
            q.pop();
            
            for(int x : arr) {
                int num = (node * x) % 1000;
                
                if(steps + 1 < dist[num]) {
                    dist[num] = steps + 1;
                    
                    if(num == end)
                        return steps + 1;
                    
                    q.push({num, steps + 1});
                }
            }
        }
        
        return -1;
    }
};
