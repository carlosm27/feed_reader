import React, { useState, useEffect } from "react";

const feeds_url = "http://localhost:2300/feed_entries";
const post_url = "http://localhost:2300/feeds"

interface Feed {
  title: string;
  link : String;
  
}


const AppFeed: React.FC = () => {
    const [feeds, setFeeds] = useState<[Feed[]]>([[]]);
    
    const [rss, setRss] = useState("");

    useEffect(() => {
        fetchFeeds();
    }, []);

    const fetchFeeds =  async () => {

        const response = await fetch(`${feeds_url}`)
        setFeeds(await response.json());
        

    };

    const AddRss = async () => {
      const newRss = {feed: { rss}};
      const options =  {

          method: 'POST',
          headers: {
              'Content-type': 'application/json; charset=UTF-8',
          },
          body: JSON.stringify(newRss),

      };
      const response = await fetch(post_url, options)
      const data = await response.json();
      setRss(data);
      setRss("");
  };

    return (
        <div>
          <h1>Feeds</h1>
              <form onSubmit={(e) => e.preventDefault()}>
                <input
                  type="text"
                  value={rss}
                  onChange={(e) => setRss(e.target.value)}
                />
                <button onClick={() => AddRss()}>Add</button>
              </form>
          <div>
          </div>
        {feeds.map((row, index) => (
            <li key={index}>
            {row.map((rss, j) => (
              <li key={j}><a href={rss.link}>{rss.title}</a></li>
              
            ))}
          </li>
        ))}
    </div>


      );
         
       

};

export default AppFeed;
