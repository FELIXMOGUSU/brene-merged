import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';
import { ENV } from './siteConfig.js';
export { ENV };
export const supabase = createClient(ENV.SUPABASE_URL || 'https://example.supabase.co', ENV.SUPABASE_ANON_KEY || 'public-anon-key-placeholder', { auth:{persistSession:false} });
