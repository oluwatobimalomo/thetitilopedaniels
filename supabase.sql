-- Run once in the Supabase SQL Editor for project djbayxrvmsclntvozyak.
create table if not exists public.blog_posts (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  slug text not null unique,
  category text not null default 'Customer experience',
  published_at date not null default current_date,
  read_time text not null default '5 min read',
  excerpt text not null,
  body text not null,
  image_url text,
  status text not null default 'published' check (status in ('published','archived')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
alter table public.blog_posts enable row level security;
drop policy if exists "Anyone can read published posts" on public.blog_posts;
create policy "Anyone can read published posts" on public.blog_posts for select to anon, authenticated using (status = 'published');
drop policy if exists "Owner can manage blog posts" on public.blog_posts;
create policy "Owner can manage blog posts" on public.blog_posts for all to authenticated using ((auth.jwt()->>'email') = 'oluwatobis.malomo@gmail.com') with check ((auth.jwt()->>'email') = 'oluwatobis.malomo@gmail.com');

insert into public.blog_posts (title,slug,category,published_at,read_time,excerpt,body,status) values
('What a support ticket can tell Product','what-a-support-ticket-can-tell-product','Customer experience','2026-09-18','5 min read','The same question arriving again and again is useful evidence. Here is how I turn it into a report a product team can act on.','When I notice the same issue in several conversations, I write down what customers were trying to do, where they got stuck and what they tried next. That gives Engineering more to work with than a screenshot and a ticket number.\n\nI include the steps to reproduce the problem, how many accounts are affected and a short customer quote when it helps explain the impact. Then I follow up to learn whether the fix solved the original problem.\n\nClosing the ticket matters. Checking whether the change helped matters too.','published'),
('Writing a help article someone can use','writing-a-help-article-someone-can-use','Knowledge management','2026-08-04','4 min read','A useful help article gets a person to the next step quickly, even when the support team is offline.','I start with the question a customer actually asked. Then I give the shortest safe path to an answer, with steps in the order someone will do them. If a step could fail, I explain what to check next.\n\nBefore sharing an article, I read it as someone who has never seen the tool. I remove internal names, explain unfamiliar terms and check every link.\n\nThe article needs an owner and a review date. Otherwise a good answer can quietly become a bad one after the product changes.','published'),
('Keeping a customer informed during an escalation','keeping-a-customer-informed-during-an-escalation','Support operations','2026-06-12','6 min read','A customer should not have to chase an update while several teams work on the same issue.','When an issue needs help from Engineering or Payments, I make one person responsible for the customer update. That person keeps the timeline visible while the specialists investigate.\n\nI confirm what is affected, what has already been tried and when the customer will hear from us again. If there is no answer yet, I still send the update at the agreed time and say what is happening next.\n\nA clear update cannot make a difficult issue disappear. It can make sure the customer is never left wondering whether anyone is working on it.','published')
on conflict (slug) do nothing;

insert into storage.buckets (id,name,public) values ('blog-images','blog-images',true) on conflict (id) do update set public = excluded.public;
drop policy if exists "Public can view blog images" on storage.objects;
create policy "Public can view blog images" on storage.objects for select to anon, authenticated using (bucket_id = 'blog-images');
drop policy if exists "Owner can upload blog images" on storage.objects;
create policy "Owner can upload blog images" on storage.objects for insert to authenticated with check (bucket_id = 'blog-images' and (auth.jwt()->>'email') = 'oluwatobis.malomo@gmail.com');
drop policy if exists "Owner can update blog images" on storage.objects;
create policy "Owner can update blog images" on storage.objects for update to authenticated using (bucket_id = 'blog-images' and (auth.jwt()->>'email') = 'oluwatobis.malomo@gmail.com') with check (bucket_id = 'blog-images' and (auth.jwt()->>'email') = 'oluwatobis.malomo@gmail.com');
drop policy if exists "Owner can delete blog images" on storage.objects;
create policy "Owner can delete blog images" on storage.objects for delete to authenticated using (bucket_id = 'blog-images' and (auth.jwt()->>'email') = 'oluwatobis.malomo@gmail.com');
