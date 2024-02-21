void addScoreToResult (Map<String,int> score , Map<String,int> total )
{ 
  score.forEach((key,value)
  {
    if(total.containsKey(key))
    {
      total[key] = total[key] !+ value;
    }else
    {
      total[key] = value;
    }
  });
}