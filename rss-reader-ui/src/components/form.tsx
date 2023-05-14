import React, { useState, useEffect } from "react";

const url = "http://localhost:2300/feed_entries";

interface Feed {
    rss : String;
    
} 

  const AppFeed: React.FC = () => {
    const [feeds, setFeeds] = useState<[Feed[]]>([[]]);
    //const [feed, setFeed] = useState("");

    useEffect(() => {
        fetchFeeds();
    }, []);

    const fetchFeeds =  async () => {

        const response = await fetch(`${url}`)
        setFeeds(await response.json());
        

    };
    
    const AddRss = () => {
      const newRss = { link: string};

      const options =  {

        method: 'POST',
        headers: {
            'Content-type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify(newRss),

    };
    }



    return (
        <div>
          <h1>Feeds</h1>
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
