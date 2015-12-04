defmodule Tirexs.Query.Logic do
  @moduledoc false

  use Tirexs.DSL.Logic

  alias Tirexs.Query, as: Query
  alias Tirexs.Query.Filter, as: Filter


  def transpose(block) do
      case block do
        {:bool, _, [params]}                  -> Query.bool(params[:do])
        {:must, _, [params]}                  -> Query.must(params[:do])
        {:filters, _, [params]}               -> Filter.filters(params[:do])
        {:should, _, [params]}                -> Query.should(params[:do])
        {:should, _, [params1, params2]}      -> Query.should(params1, params2[:do])
        {:must_not, _, [params]}              -> Query.must_not(params[:do])
        {:match, _, params}                   -> Query.match(params)
        {:multi_match, _, params}             -> Query.multi_match(params)
        {:query_string, _, params}            -> Query.query_string(params)
        {:string, _, params}                  -> Query.query_string(params)
        {:ids, _, params}                     -> Query.ids(params)
        {:range, _, params}                   -> Query.range(params)
        {:term, _, params}                    -> Query.term(params)
        {:boosting, _, [params]}              -> Query.boosting(params[:do])
        {:boosting, _, options}               -> Query.boosting(options)
        {:positive, _, params}                -> Query.positive(params)
        {:negative, _, params}                -> Query.negative(params)
        {:custom_score, _, [params]}          -> Query.custom_score(params[:do])
        {:custom_score, _, options}           -> Query.custom_score(options)
        {:custom_boost_factor, _, [params]}   -> Query.custom_boost_factor(params[:do])
        {:custom_boost_factor, _, options}    -> Query.custom_boost_factor(options)
        {:constant_score, _, [params]}        -> Query.constant_score(params[:do])
        {:constant_score, _, options}         -> Query.constant_score(options)
        {:dis_max, _, [params]}               -> Query.dis_max(params[:do])
        {:dis_max, _, options}                -> Query.dis_max(options)
        {:queries, _, [params]}               -> Query.queries(params[:do])
        {:field, _, params}                   -> Query.field(params)
        {:flt, _, params}                     -> Query.flt(params)
        {:flt_field, _, params}               -> Query.flt_field(params)
        {:fuzzy, _, params}                   -> Query.fuzzy(params)
        {:query, _, [params]}                 -> Query._query(params[:do])
        {:filter, _, [params]}                -> Filter._filter(params[:do])
        {:filter, _, options}                 -> Filter._filter(options)
        {:filtered, _, [params]}              -> Filter.filtered(params[:do])
        {:has_child, _, [params]}             -> Query.has_child(params[:do])
        {:has_child, _, options}              -> Query.has_child(options)
        {:has_parent, _, [params]}            -> Query.has_parent(params[:do])
        {:has_parent, _, options}             -> Query.has_parent(options)
        {:match_all, _, nil}                  -> Query.match_all([])
        {:match_all, _, [params]}             -> Query.match_all(params)
        {:mlt, _, params}                     -> Query.mlt(params)
        {:mlt_field, _, params}               -> Query.mlt_field(params)
        {:prefix, _, params}                  -> Query.prefix(params)
        {:span_first, _, [params]}            -> Query.span_first(params[:do])
        {:span_first, _, options}             -> Query.span_first(options)
        {:span_term, _, params}               -> Query.span_term(params)
        {:span_near, _, [params]}             -> Query.span_near(params)
        {:span_near, _, options}              -> Query.span_near(options)
        {:clauses, _, [params]}               -> Query.clauses(params[:do])
        {:span_not, _, [params]}              -> Query.span_not(params[:do])
        {:span_not, _, options}               -> Query.span_not(options)
        {:include, _, [params]}               -> Query.include(params)
        {:exclude, _, [params]}               -> Query.exclude(params)
        {:span_or, _, [params]}               -> Query.span_or(params[:do])
        {:span_or, _, options}                -> Query.span_or(options)
        {:terms, _, params}                   -> Query.terms(params)
        {:top_children, _, [params]}          -> Query.top_children(params)
        {:top_children, _, options}           -> Query.top_children(options)
        {:wildcard, _, params}                -> Query.wildcard(params)
        {:no_match_query, _, [params]}        -> Query.no_match_query(params[:do])
        {:indices, _, [params]}               -> Query.indices(params[:do])
        {:indices, _, params}                 -> Query.indices(params)
        {:text, _, params}                    -> Query.text(params)
        {:text_phrase, _, params}             -> Query.text_phrase(params)
        {:text_phrase_prefix, _, params}      -> Query.text_phrase_prefix(params)
        {:geo_shape, _, [params]}             -> Query.geo_shape(params[:do])
        {:geo_shape, _, options}              -> Query.geo_shape(options)
        {:location, _, [params]}              -> Query.location(params[:do])
        {:location, _, options}               -> Query.location(options)
        {:shape, _, [params]}                 -> Query.shape(params)
        {:indexed_shape, _, [params]}         -> Query.indexed_shape(params)
        {:exists, _, params}                  -> Filter.exists(params)
        {:limit, _, params}                   -> Filter.limit(params)
        {:type, _, params}                    -> Filter.type(params)
        {:missing, _, params}                 -> Filter.missing(params)
        {:geo_bounding_box, _, params}        -> Filter.geo_bounding_box(params)
        {:geo_distance, _, params}            -> Filter.geo_distance(params)
        {:geo_distance_range, _, params}      -> Filter.geo_distance_range(params)
        {:geo_polygon, _, params}             -> Filter.geo_polygon(params)
        {:_not, _, [params]}                  -> Filter._not(params[:do])
        {:_not, _, options}                   -> Filter._not(options)
        {:_and, _, [params]}                  -> Filter._and(params[:do])
        {:_and, _, options}                   -> Filter._and(options)
        {:_or, _, [params]}                   -> Filter._or(params[:do])
        {:_or, _, options}                    -> Filter._or(options)
        {:numeric_range, _, params}           -> Filter.numeric_range(params)
        {:fquery, _, [params]}                -> Filter.fquery(params[:do])
        {:fquery, _, options}                 -> Filter.fquery(options)
        {:script, _, params}                  -> Filter.script(params)
        {:nested, _, [params]}                -> Query.nested(params[:do])
        {:nested, _, options}                 -> Query.nested(options)
        {:rescore_query, _, [params]}         -> Query.rescore_query(params[:do])
        {:rescore_query, _, options}          -> Query.rescore_query(options)
        {:facet_filter, _, [params]}          -> Query.facet_filter(params[:do])
        {:facet_filter, _, options}           -> Query.facet_filter(options)
        {:custom_filters_score, _, [params]}  -> Query.custom_filters_score(params[:do])
        {:custom_filters_score, _, options}   -> Query.custom_filters_score(options)
        {:boost, _, params}                   -> Query.boost(params)
        {:group, _, [params]}                 -> Query.group(params[:do])
        {:group, _, options}                  -> Query.group(options)

        _ -> IO.puts inspect(block)
      end
  end


  def without_array([], acc), do: acc

  def without_array([h|t], acc) do
    acc = acc ++ [List.first h]
    without_array(t, acc)
  end

  def without_array(_array, acc), do: acc
end
