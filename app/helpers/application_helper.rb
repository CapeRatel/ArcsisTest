module ApplicationHelper
  def boolean_humanize(data)
    data ? t('shared.true') : t('shared.false')
  end
end
