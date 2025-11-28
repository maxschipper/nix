#! /usr/bin/env nix-shell
/*
#! nix-shell -i "bun run" -p bun
needs to be a comment because bun tries to interpret this as ts code
*/



/*
fetches/prints/deletes data from local activitywatch server based on your filter
based on: https://forum.activitywatch.net/t/add-an-exclude-list/345/17
Instructions:
1) You'll need Bun to run this script. See https://bun.sh
2) Open http://localhost:5600/#/buckets and copy your bucket names into BUCKETS array in code below.
You probably only have one bucket of interest.
I have two buckets because I also have the Chrome extensions installed.
My buckets are "aw-watcher-window_i7rtx3060" and "aw-watcher-web-chrome".
4) Edit SEARCH_EVENTS_CONTAINING with words you want to filter/delete.
5) Make sure DELETE_MATCHED_EVENTS = false on the first run to see what events are found first. You don't want to delete something important.
6) Execute this script with `bun run index.ts`
7) Once you are satisfied with the events it found to delete, set DELETE_MATCHED_EVENTS = true and run the script again.
*/
import { fetch } from 'bun';

const BUCKETS = ['aw-watcher-window_yoga'];
const SEARCH_EVENTS_CONTAINING = ['mozilla firefox private browsing'];
// const SEARCH_EVENTS_CONTAINING = ['- mpv'];
const DELETE_MATCHED_EVENTS = true;
const main = async () => {

   let totalMatches = 0;
   
   for (const BUCKET of BUCKETS) {
      const events = (await (await fetch(`http://localhost:5600/api/0/buckets/${BUCKET}/events?limit=500000`)).json()) as any[];

      for (const event of events) {
         // Default Windows AW data is in this format:
         // {"id": 14567, "timestamp": "2024-09-26T11:15:51.771000+00:00", "duration": 4.051, "data": {"app": "chrome.exe", "title": "TypeScript | Bun Docs - Google Chrome"}}
         // Chrome extension data is in this format:
         // {"id": 24471, "timestamp": "2024-09-28T12:18:12.587000+00:00", "duration": 0.698, "data": {"url": "https://developer.mozilla.org/en-US/docs/Web/API/Request", "title": "Request - Web APIs | MDN", "audible": false, "incognito": false, "tabCount": 21}}
         const searchString = ((event.data.url || '') + (event.data.title || '')).toLowerCase();
         if (SEARCH_EVENTS_CONTAINING.some((search) => searchString.includes(search))) {
            console.log('Found:', searchString);
            totalMatches++;

            if (DELETE_MATCHED_EVENTS) {
               await fetch(`http://localhost:5600/api/0/buckets/${BUCKET}/events/${event.id}`, { method: 'DELETE' });
               console.log('Deleted:', searchString, ' with id ', event.id);
            }
         }
      }
      console.log('Done searching total events:', events.length, 'in bucket:', BUCKET);
   }

   console.log('Total matches found across all buckets:', totalMatches);
};
main().catch((err) => console.error('Error:', err));
