🏆 Consistency creates results. Results create confidence.

Excited to receive the certificate for successfully completing the GeeksforGeeks 60 Days POTD Challenge 🚀💻

For the past 60+ days, I’ve been consistently solving problems, improving my DSA skills, and pushing myself to learn something new every single day.

This journey taught me:
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
